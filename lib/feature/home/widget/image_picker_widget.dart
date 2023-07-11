import 'package:dotted_border/dotted_border.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class PickedImageWidgetItem extends Equatable {
  final String? value;
  const PickedImageWidgetItem({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}

class ImagePickerWidget extends FormField<PickedImageWidgetItem> {
  /// Creates a [Select Gender Widget] widget that is a [FormField], wrapped in an
  /// [InputDecorator].
  ///
  /// For a description of the `onSaved`, `validator`, or `autovalidateMode`
  /// parameters, see [FormField].
  ///
  final ValueChanged<PickedImageWidgetItem?>? onChanged;
  final PickedImageWidgetItem items;

  ImagePickerWidget({
    Key? key,
    PickedImageWidgetItem? value,
    AutovalidateMode? autovalidateMode,
    FocusNode? focusNode,
    bool enabled = true,
    bool? autoFocus = false,
    FormFieldSetter<PickedImageWidgetItem>? onSaved,
    this.onChanged,
    required this.items,
    required FormFieldValidator<PickedImageWidgetItem> validator,
  })  : assert(autoFocus != null),
        super(
          key: key,
          onSaved: onSaved,
          initialValue: value,
          validator: validator,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<PickedImageWidgetItem> field) {
            final _SelectableFormFieldState state =
                field as _SelectableFormFieldState;
            const InputDecoration decorationArg = InputDecoration();
            final InputDecoration effectiveDecoration =
                decorationArg.applyDefaults(
              Theme.of(field.context).inputDecorationTheme,
            );
            // An unfocusable Focus widget so that this widget can detect if its
            // descendants have focus or not.
            return Focus(
              canRequestFocus: false,
              skipTraversal: true,
              child: Builder(builder: (BuildContext context) {
                return InputDecorator(
                  decoration: effectiveDecoration.copyWith(
                    errorText: field.errorText,
                    enabled: enabled,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                  isEmpty: state.value == null,
                  isFocused: Focus.of(context).hasFocus,
                  child: _SelectableWidget(
                    initialValue: state.value,
                    onSaved: onSaved,
                    onChange: state.didChange,
                    item: items,
                  ),
                );
              }),
            );
          },
        );

  @override
  FormFieldState<PickedImageWidgetItem> createState() =>
      _SelectableFormFieldState();
}

class _SelectableFormFieldState extends FormFieldState<PickedImageWidgetItem> {
  @override
  void didChange(PickedImageWidgetItem? value) {
    super.didChange(value);
    final ImagePickerWidget dropdownButtonFormField = widget;
    if (dropdownButtonFormField.onChanged != null) {
      dropdownButtonFormField.onChanged!(value);
    }
  }

  @override
  void didUpdateWidget(ImagePickerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setValue(widget.initialValue);
    }
  }

  @override
  ImagePickerWidget get widget => super.widget as ImagePickerWidget;
}

// ignore: must_be_immutable
class _SelectableWidget extends BaseStatelessWidget {
  final void Function(PickedImageWidgetItem?)? onChange;
  final void Function(PickedImageWidgetItem?)? onSaved;
  final PickedImageWidgetItem item;
  final PickedImageWidgetItem? initialValue;

  PickedImageWidgetItem? selectedItem;

  _SelectableWidget(
      {Key? key,
      required this.item,
      this.onChange,
      this.onSaved,
      this.initialValue})
      : selectedItem = initialValue,
        super(key: key);

  @override
  Widget baseBuild(BuildContext context) {
    return InkWell(
      onTap: () async {
        String? hold = await _pickImage();
        if (hold != null) {
          PickedImageWidgetItem selectableWidgetItem =
              PickedImageWidgetItem(value: hold);
          changeChoose(selectableWidgetItem);
        }
      },
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: selectedItem == null
            ? DottedBorder(
                color: AppColors.homeScreenAddPhotoBorder,
                strokeWidth: 2,
                radius: Radius.circular(10.r),
                borderType: BorderType.RRect,
                child: SizedBox(
                    height: 82.h,
                    width: 100.w,
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(child: Icon(AppIcons.addPhoto)),
                          SizedBox(height: 5.h),
                          Flexible(
                            child: AppTextWidget(
                                text: translate(LocalizationKeys.addPhoto)!,
                                boxFit: BoxFit.scaleDown,
                                alignment: AlignmentDirectional.center,
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 12)),
                          )
                        ],
                      ),
                    )))
            : SizedBox(
                height: 70.h,
                width: 71.w,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: Image.asset(
                        selectedItem!.value!,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      right: -11,
                      top: -8,
                      child: IconButton(
                          onPressed: () => changeChoose(null),
                          icon: SizedBox(
                            height: 15.w,
                            width: 15.w,
                            child: Card(
                              margin: EdgeInsets.zero,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: Center(
                                child: Icon(
                                  AppIcons.closeIcon,
                                  color: Colors.black,
                                  size: 15.sp,
                                  weight: 900,
                                ),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  changeChoose(PickedImageWidgetItem? choose) {
    selectedItem = choose;
    if (onChange != null) {
      onChange!(selectedItem);
    }
    if (onSaved != null) {
      onSaved!(selectedItem);
    }
  }

  /// /////////////////////////////////////////////////////////
  /// /////////////////////Helper Methods//////////////////////
  /// /////////////////////////////////////////////////////////
  Future<String?> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return pickedImage.path;
    } else {
      return null;
    }
  }
}
