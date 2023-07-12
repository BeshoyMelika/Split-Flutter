import 'package:flutter/material.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class HomeScreenHelper {
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
}
