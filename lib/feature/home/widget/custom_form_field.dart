import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:split/res/app_colors.dart';

class SelectableWidgetItem extends Equatable {
  final String value;
  final String key;
  const SelectableWidgetItem({
    required this.value,
    required this.key,
  });

  @override
  List<Object?> get props => [value, key];
}

class SelectableFormFieldWidget extends FormField<SelectableWidgetItem> {
  /// Creates a [Select Gender Widget] widget that is a [FormField], wrapped in an
  /// [InputDecorator].
  ///
  /// For a description of the `onSaved`, `validator`, or `autovalidateMode`
  /// parameters, see [FormField].
  ///
  final ValueChanged<SelectableWidgetItem?>? onChanged;
  final List<SelectableWidgetItem> items;

  SelectableFormFieldWidget({
    Key? key,
    SelectableWidgetItem? value,
    AutovalidateMode? autovalidateMode,
    FocusNode? focusNode,
    bool enabled = true,
    bool? autoFocus = false,
    FormFieldSetter<SelectableWidgetItem>? onSaved,
    this.onChanged,
    required this.items,
    required FormFieldValidator<SelectableWidgetItem> validator,
  })  : assert(autoFocus != null),
        super(
          key: key,
          onSaved: onSaved,
          initialValue: value,
          validator: validator,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<SelectableWidgetItem> field) {
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
  FormFieldState<SelectableWidgetItem> createState() =>
      _SelectableFormFieldState();
}

class _SelectableFormFieldState extends FormFieldState<SelectableWidgetItem> {
  @override
  void didChange(SelectableWidgetItem? value) {
    super.didChange(value);
    final SelectableFormFieldWidget dropdownButtonFormField = widget;
    if (dropdownButtonFormField.onChanged != null) {
      dropdownButtonFormField.onChanged!(value);
    }
  }

  @override
  void didUpdateWidget(SelectableFormFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setValue(widget.initialValue);
    }
  }

  @override
  SelectableFormFieldWidget get widget =>
      super.widget as SelectableFormFieldWidget;
}

// ignore: must_be_immutable
class _SelectableWidget extends StatelessWidget {
  final void Function(SelectableWidgetItem?)? onChange;
  final void Function(SelectableWidgetItem?)? onSaved;
  final List<SelectableWidgetItem> items;
  final SelectableWidgetItem? initialValue;

  SelectableWidgetItem? selectedItem;

  _SelectableWidget(
      {Key? key,
      required this.items,
      this.onChange,
      this.onSaved,
      this.initialValue})
      : selectedItem = initialValue,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: items
            .map(
              (selectableWidgetItem) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor: (selectedItem ==
                                  selectableWidgetItem)
                              ? MaterialStateProperty.all<Color>(
                                  AppColors.selectableFormFieldBackground)
                              : MaterialStateProperty.all<Color>(
                                  AppColors.unSelectableFormFieldBackground),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(18)),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide.none),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)))),
                      child: Text(
                        selectableWidgetItem.value,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: (selectedItem == selectableWidgetItem)
                                    ? AppColors.selectableFormFieldText
                                    : AppColors.unSelectableFormFieldText),
                      ),
                      onPressed: () => changeChoose(selectableWidgetItem)),
                ),
              ),
            )
            .toList());
  }

  changeChoose(SelectableWidgetItem choose) {
    selectedItem = choose;
    if (onChange != null) {
      onChange!(selectedItem!);
    }
    if (onSaved != null) {
      onSaved!(selectedItem!);
    }
  }
}
