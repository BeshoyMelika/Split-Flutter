import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateless_widget.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class CurrencyPickerWidgetItem extends Equatable {
  final String value;
  final String key;
  const CurrencyPickerWidgetItem({
    required this.value,
    required this.key,
  });

  @override
  List<Object?> get props => [value, key];
}

class CurrencyPickerWidget extends FormField<CurrencyPickerWidgetItem> {
  /// Creates a [Select Gender Widget] widget that is a [FormField], wrapped in an
  /// [InputDecorator].
  ///
  /// For a description of the `onSaved`, `validator`, or `autovalidateMode`
  /// parameters, see [FormField].
  ///
  final ValueChanged<CurrencyPickerWidgetItem?>? onChanged;
  final List<CurrencyPickerWidgetItem> items;

  CurrencyPickerWidget({
    Key? key,
    CurrencyPickerWidgetItem? value,
    AutovalidateMode? autovalidateMode,
    FocusNode? focusNode,
    bool enabled = true,
    bool? autoFocus = false,
    FormFieldSetter<CurrencyPickerWidgetItem>? onSaved,
    this.onChanged,
    required this.items,
    required FormFieldValidator<CurrencyPickerWidgetItem> validator,
  })  : assert(autoFocus != null),
        super(
          key: key,
          onSaved: onSaved,
          initialValue: value,
          validator: validator,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<CurrencyPickerWidgetItem> field) {
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
                    items: items,
                  ),
                );
              }),
            );
          },
        );

  @override
  FormFieldState<CurrencyPickerWidgetItem> createState() =>
      _SelectableFormFieldState();
}

class _SelectableFormFieldState
    extends FormFieldState<CurrencyPickerWidgetItem> {
  @override
  void didChange(CurrencyPickerWidgetItem? value) {
    super.didChange(value);
    final CurrencyPickerWidget dropdownButtonFormField = widget;
    if (dropdownButtonFormField.onChanged != null) {
      dropdownButtonFormField.onChanged!(value);
    }
  }

  @override
  void didUpdateWidget(CurrencyPickerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setValue(widget.initialValue);
    }
  }

  @override
  CurrencyPickerWidget get widget => super.widget as CurrencyPickerWidget;
}

// ignore: must_be_immutable
class _SelectableWidget extends BaseStatelessWidget {
  final void Function(CurrencyPickerWidgetItem?)? onChange;
  final void Function(CurrencyPickerWidgetItem?)? onSaved;
  final List<CurrencyPickerWidgetItem> items;
  final CurrencyPickerWidgetItem? initialValue;

  CurrencyPickerWidgetItem? selectedItem;

  _SelectableWidget(
      {Key? key,
      required this.items,
      this.onChange,
      this.onSaved,
      this.initialValue})
      : selectedItem = initialValue,
        super(key: key);
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(
      List<CurrencyPickerWidgetItem> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.add(
        DropdownMenuItem<String>(
          value: item.value,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: AppTextWidget(
                  alignment: AlignmentDirectional.center,
                  boxFit: BoxFit.scaleDown,
                  text: translate(item.value)!,
                  style: textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 18))),
        ),
      );
    }
    return menuItems;
  }

  final FocusNode focusNode = FocusNode();
  @override
  Widget baseBuild(BuildContext context) {
    return SizedBox(
      width: 298.w,
      height: 60.h,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          focusNode: focusNode,
          isExpanded: true,
          style: const TextStyle(
              color: AppColors.bodyMedium,
              fontSize: 18,
              fontWeight: FontWeight.w400),
          hint: AppTextWidget(
              alignment: AlignmentDirectional.center,
              boxFit: BoxFit.scaleDown,
              text: translate(LocalizationKeys.dollar)!,
              style: const TextStyle(
                  color: AppColors.bodySmall,
                  fontSize: 18,
                  fontWeight: FontWeight.w400)),
          items: _addDividersAfterItems(items),
          value: selectedItem == null ? selectedValue : selectedItem!.value,
          onChanged: (value) {
            CurrencyPickerWidgetItem selectableWidgetItem =
                CurrencyPickerWidgetItem(
                    value: value ?? "s", key: value ?? "s");
            changeChoose(selectableWidgetItem);
          },
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              color: AppColors.homeScreenGenderPickerDropDownMenu,
              border: Border.all(
                  color: AppColors.homeScreenGenderPickerDropDownMenu),
            ),
          ),
          iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down,
              ),
              iconSize: 16,
              iconEnabledColor: AppColors.bodyMedium),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200.h,
            width: 350.w,
            padding: null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ),
    );
  }

  changeChoose(CurrencyPickerWidgetItem choose) {
    selectedItem = choose;
    if (onChange != null) {
      onChange!(selectedItem!);
    }
    if (onSaved != null) {
      onSaved!(selectedItem!);
    }
  }
}
