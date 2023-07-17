import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:split/feature/create_group/widget/create_group_screen_list_item.dart';

class NewGroupTypeItem extends Equatable {
  final String value;
  final String key;
  final IconData? icon;
  const NewGroupTypeItem({
    required this.value,
    this.icon,
    required this.key,
  });

  @override
  List<Object?> get props => [value, key];
}

class NewGroupTypeItemsListFormFieldWidget extends FormField<NewGroupTypeItem> {
  /// Creates a [Select Gender Widget] widget that is a [FormField], wrapped in an
  /// [InputDecorator].
  ///
  /// For a description of the `onSaved`, `validator`, or `autovalidateMode`
  /// parameters, see [FormField].
  ///
  final ValueChanged<NewGroupTypeItem?>? onChanged;
  final List<NewGroupTypeItem> items;

  NewGroupTypeItemsListFormFieldWidget({
    Key? key,
    NewGroupTypeItem? value,
    AutovalidateMode? autovalidateMode,
    FocusNode? focusNode,
    bool enabled = true,
    bool? autoFocus = false,
    FormFieldSetter<NewGroupTypeItem>? onSaved,
    this.onChanged,
    required this.items,
    required FormFieldValidator<NewGroupTypeItem> validator,
  })  : assert(autoFocus != null),
        super(
          key: key,
          onSaved: onSaved,
          initialValue: value,
          validator: validator,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<NewGroupTypeItem> field) {
            final _NewGroupTypeFormFieldState state =
                field as _NewGroupTypeFormFieldState;
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
                  child: _NewGoupItemsListWidget(
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
  FormFieldState<NewGroupTypeItem> createState() =>
      _NewGroupTypeFormFieldState();
}

class _NewGroupTypeFormFieldState extends FormFieldState<NewGroupTypeItem> {
  @override
  void didChange(NewGroupTypeItem? value) {
    super.didChange(value);
    final NewGroupTypeItemsListFormFieldWidget dropdownButtonFormField = widget;
    if (dropdownButtonFormField.onChanged != null) {
      dropdownButtonFormField.onChanged!(value);
    }
  }

  @override
  void didUpdateWidget(NewGroupTypeItemsListFormFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setValue(widget.initialValue);
    }
  }

  @override
  NewGroupTypeItemsListFormFieldWidget get widget =>
      super.widget as NewGroupTypeItemsListFormFieldWidget;
}

// ignore: must_be_immutable
class _NewGoupItemsListWidget extends StatelessWidget {
  final void Function(NewGroupTypeItem?)? onChange;
  final void Function(NewGroupTypeItem?)? onSaved;
  final List<NewGroupTypeItem> items;
  final NewGroupTypeItem? initialValue;

  NewGroupTypeItem? selectedItem;

  _NewGoupItemsListWidget(
      {Key? key,
      required this.items,
      this.onChange,
      this.onSaved,
      this.initialValue})
      : selectedItem = initialValue,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: items
              .map(
                (selectableWidgetItem) => InkWell(
                  onTap: () => changeChoose(selectableWidgetItem),
                  child: selectableWidgetItem.icon == null
                      ? CreateGroupScreenListItem(
                          null,
                          text: selectableWidgetItem.value,
                          selected: selectedItem == selectableWidgetItem,
                        )
                      : CreateGroupScreenListItem(selectableWidgetItem.icon,
                          text: selectableWidgetItem.value,
                          selected: selectedItem == selectableWidgetItem),
                ),
              )
              .toList()),
    );
  }

  changeChoose(NewGroupTypeItem choose) {
    selectedItem = choose;
    if (onChange != null) {
      onChange!(selectedItem!);
    }
    if (onSaved != null) {
      onSaved!(selectedItem!);
    }
  }
}
