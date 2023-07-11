import 'package:flutter/material.dart';

/// to control all colors, app theme, without any need to dig into code
/// any new color or existing color will have a const with its value
/// there is a stand alone variable for any widget, text, image or icon
///
/// All name colors according to https://chir.ag/projects/name-that-color
class AppColors {
  static const _black = Colors.black;
  static const _white = Colors.white;
  static const _grey = Colors.grey;
  static const _red = Colors.red;
  static const _transparent = Colors.transparent;
  static const _blueZodiac = Color(0xff10164B);
  static const _chestnutRose = Color(0xffD15957);
  static const _blueRibbon = Color(0xff0437F2);
  static const _silver = Color(0xffc8c8c8);
  static const _silverSplit = Color(0xffBDBDBD);
  static const _cloudBurst = Color(0xff253659);
  static const _alto = Color(0xffD9D9D9);

  static const _whisper = Color(0xffF5F5FA);
  static const _alabaster = Color(0xffF9F9F9);

  static const _thunder = Color(0xff231F20);
  static const _mineShaft = Color(0xff3B3B3B);
  static const _gallery = Color(0xffECECEC);

  static const _guardsmanRed = Color(0xffBC0000);
  static const _ecstasy = Color(0xffF58220);

  static const _buttercup10Opacity = Color.fromARGB(255, 245, 234, 211);

  static const _mandysPink = Color(0xffF2B9B9);
  static const _goblink = Color(0xff378A3A);
  static const _madang = Color(0xffC0F1C2);
  static const _apple = Color(0xff54B435);

  /// app main theme ...

  static const colorSchemeSeed = _cloudBurst;
  static const colorPrimary = _cloudBurst;
  static const focus = _blueRibbon;
  static const scaffoldBackground = _whisper;
  static const appBarBackground = _white;
  static const appBarTextColor = _blueZodiac;
  static const statusBar = _blueZodiac;
  static const floatActionBtnIcon = _white;
  static const floatActionBtnText = _white;
  static const floatActionBtnBackground = _ecstasy;
  static const buttonTextLight = _white;
  static const iconTheme = _blueZodiac;
  static const appBarIcon = _white;
  static const titleMedium = _blueRibbon;
  static const headlineMedium = _blueZodiac;
  static const bodyMedium = _black;
  static const bodyLarge = _cloudBurst;
  static const bodySmall = _silverSplit;
  static const titleLarge = _white;
  static const labelLarge = _thunder;
  static const labelMedium = _mineShaft;
  static const labelSmall = _grey;
  static const backLoginIconBackground = _white;
  static const removeHighlight = _transparent;
  static const backGroundCard = _white;
  static const backGroundContainer = _white;
  static const removeTxt = _chestnutRose;

  /// base widget
  static const baseWidgetBackground = _transparent;
  static const selectableFormFieldText = _black;
  static const selectableFormFieldBackground = _black;
  static const unSelectableFormFieldText = _red;
  static const unSelectableFormFieldBackground = _red;

  /// toast ..
  static const toastBackground = _black;
  static const toastText = _white;

  /// app form field

  static final appFormFieldFill = _white.withOpacity(.1);
  static const enabledAppFormFieldBorder = _white;
  static const appFormFieldText = _white;
  static const appFormFieldSuffixIcon = _white;
  static const appFormFieldPrefixIcon = _white;
  static const disabledAppFormFieldBorder = _silver;

  /// Custom DropDown Widget
  static const appDropdownFill = _white;
  static const appDropdownDisabledBorder = _silver;
  static const appDropdownEnabledBorder = _white;
  static const appDropdownFocusedBorder = _blueZodiac;

  /// paging
  static const paginationLoadingBackground = _white;

  /// general app bar
  static const generalAppBarBackground = _cloudBurst;

  /// home

  static const homeUserModeAlert = _buttercup10Opacity;

  static const containerDivide = _silver;

  ///dialog
  static const packageIcon = _blueRibbon;
  static const doneIconBg = _blueRibbon;
  static const doneIcon = _white;
  static const languageUnActive = _grey;
  static const languageActive = _black;
  static const dividerColor = _grey;
  static const confirmIconBackground = _red;
  static const confirmIcon = _white;

  /// connectivity widget
  static const connectedToInternetBackground = _madang;
  static const notConnectedToInternetBackground = _mandysPink;
  static const connectedToInternetText = _goblink;
  static const connectedToInternetIcon = _goblink;
  static const notConnectedToInternetIcon = _guardsmanRed;
  static const notConnectedToInternetText = _guardsmanRed;

  /// Auth Screen
  static const loginButtonBg = _apple;

  /// home screen
  static const homeScreenBackground = _alabaster;
  static const homeScreenTextFormFieldFilled = _white;
  static const homeScreenTextFormFieldFocusBorder = _cloudBurst;
  static const homeScreenTextFormFieldErrorBorder = _red;
  static const homeScreenTextFormFieldHintText = _gallery;
  static const homeScreenTypeListIconsUnSelected = _silverSplit;
  static const homeScreenTypeListIconsSelected = _white;
  static const homeScreenTypeListCardSelected = _cloudBurst;
  static const homeScreenAddPhotoBorder = _alto;
  static const homeScreenButton = _cloudBurst;
  static const homeScreenTypeListCardUnSelected = _white;
  static const homeScreenGenderPickerDropDownMenu = _white;
  static const homeScreenCancelButton = _alto;

  /// onboarding screen

  static const onBoardingScreenScaffoldBackground = _white;
  static const onBoardingScreenIndicatorDots = _cloudBurst;
}
