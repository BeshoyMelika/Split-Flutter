import 'package:flutter/material.dart';
import 'package:split/feature/create_group/widget/currency_picker_form_field_widget.dart';
import 'package:split/feature/create_group/widget/new_group_type_items_list_form_field_widget.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/locale/app_localization.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class CreateGroupScreenHelper {
  List<IconData> typeListIcons = [
    AppIcons.plane,
    AppIcons.home,
    AppIcons.tower,
    AppIcons.plane
  ];

  List<String> typeListStrings = [
    LocalizationKeys.trip,
    LocalizationKeys.home,
    LocalizationKeys.tower,
    LocalizationKeys.tower,
  ];
  List<String> typeOfSplitListStrings = [
    LocalizationKeys.equal,
    LocalizationKeys.specified,
    LocalizationKeys.percentage,
  ];
  final List<String> currencyListItems = [
    LocalizationKeys.dollar,
    LocalizationKeys.pound,
  ];

  /// new group type list
  List<NewGroupTypeItem> getCurrentTypesItemsList(
          AppLocalizations appLocalized) =>
      typeListStrings
          .map((e) => NewGroupTypeItem(
              value: appLocalized.translate(e)!,
              key: e,
              icon: typeListIcons[typeListStrings.indexOf(e)]))
          .toList();

  /// new group split type list
  List<NewGroupTypeItem> getCurrentTypesOfSplitItemsList(
          AppLocalizations appLocalized) =>
      typeOfSplitListStrings
          .map((e) => NewGroupTypeItem(
              value: appLocalized.translate(e)!, key: e, icon: null))
          .toList();

  /// new group currency type list
  List<CurrencyPickerWidgetItem> getCurrencyPickerItemsList() =>
      currencyListItems
          .map((e) => CurrencyPickerWidgetItem(value: e, key: e))
          .toList();
}
