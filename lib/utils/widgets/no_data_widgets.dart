import 'package:flutter/material.dart';
import 'package:split/utils/locale/app_localization.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

Widget noData(AppLocalizations appLocale) {
  return Center(
    child: Text(appLocale.translate(LocalizationKeys.noData)!),
  );
}
