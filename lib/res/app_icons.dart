import 'package:flutter/material.dart';

class AppIcons {
  AppIcons._();

  static const String? _fontPackageKey = null;
  static const _homeFontFamilyKey = 'HomeIconsFont';

  static const _connectivityIcons = 'ConnectivityIcons';

  //
  // /// date time icons
  static const IconData wifiOffIcon = IconData(0xe800,
      fontFamily: _connectivityIcons, fontPackage: _fontPackageKey);
  static const IconData wifiOnIcon = IconData(0xe801,
      fontFamily: _connectivityIcons, fontPackage: _fontPackageKey);

  static const IconData notify = IconData(0xe800,
      fontFamily: _homeFontFamilyKey, fontPackage: _fontPackageKey);
  static const IconData phone = IconData(0xe801,
      fontFamily: _homeFontFamilyKey, fontPackage: _fontPackageKey);
  static const IconData mail = IconData(0xe802,
      fontFamily: _homeFontFamilyKey, fontPackage: _fontPackageKey);
  static const IconData meeting = IconData(0xe803,
      fontFamily: _homeFontFamilyKey, fontPackage: _fontPackageKey);
  static const IconData menu = IconData(0xe804,
      fontFamily: _homeFontFamilyKey, fontPackage: _fontPackageKey);
  static const IconData doc = IconData(0xe805,
      fontFamily: _homeFontFamilyKey, fontPackage: _fontPackageKey);
  static const IconData attach = IconData(0xe806,
      fontFamily: _homeFontFamilyKey, fontPackage: _fontPackageKey);
  static const IconData video = IconData(0xe807,
      fontFamily: _homeFontFamilyKey, fontPackage: _fontPackageKey);

  static const _homeScreenIconsFamily = 'HomeScreenIconsFamily';

  static const IconData plane =
      IconData(0xe811, fontFamily: _homeScreenIconsFamily);
  static const IconData tower =
      IconData(0xe812, fontFamily: _homeScreenIconsFamily);
  static const IconData home =
      IconData(0xe813, fontFamily: _homeScreenIconsFamily);
  static const IconData addPhoto =
      IconData(0xe814, fontFamily: _homeScreenIconsFamily);
  static const _addParticipantFamily = 'AddParticipantIconFamily';

  static const IconData addParticipant =
      IconData(0xe815, fontFamily: _addParticipantFamily);
}

/// generator helper website
/// https://www.fluttericon.com/
