import 'package:flutter/material.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/utils/locale/app_localization.dart';

class AppTheme {
  late TextTheme arabicTextTheme;

  AppTheme(this.locale) {
    arabicTextTheme = const TextTheme(
      headlineMedium: TextStyle(color: AppColors.headlineMedium, fontSize: 22),

      bodyMedium: TextStyle(
        color: AppColors.bodyMedium,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        color: AppColors.titleMedium,
      ),
      // for subtitle
      labelLarge: TextStyle(
        color: AppColors.labelLarge,
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColors.labelMedium,
      ),
    );
  }

  final Locale locale;

  /// The Light Theme
  ThemeData get themeDataLight {
    return ThemeData(
      // useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.colorSchemeSeed,
        primary: AppColors.colorPrimary,
      ),
      primaryColor: AppColors.colorPrimary,
      brightness: Brightness.light,
      focusColor: AppColors.focus,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      textTheme: txtThemeLight,
      iconTheme:
          ThemeData.light().iconTheme.copyWith(color: AppColors.iconTheme),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.floatActionBtnIcon,
        backgroundColor: AppColors.floatActionBtnBackground,
      ),

      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            centerTitle: false,
            elevation: 0,
            iconTheme: ThemeData.light()
                .iconTheme
                .copyWith(color: AppColors.appBarIcon),
            titleTextStyle: txtThemeLight.bodyMedium?.copyWith(
              fontSize: 20,
              color: AppColors.appBarTextColor,
              fontWeight: FontWeight.w800,
            ),
            backgroundColor: AppColors.appBarBackground,
          ),
    );
  }

  TextTheme get txtThemeLight => _textTheme.copyWith(
        headlineMedium: _textTheme.headlineMedium?.copyWith(
          color: AppColors.headlineMedium,
          fontSize: 22,
        ),

        // black
        bodyMedium: _textTheme.bodyMedium?.copyWith(
          color: AppColors.bodyMedium,
        ),

        // white
        titleLarge: const TextStyle(
          color: AppColors.titleLarge,
        ),

        // for desc of widget and title of text form field
        titleSmall: _textTheme.titleLarge?.copyWith(
          color: AppColors.titleSmall,
        ),

        //for title of widget
        bodyLarge: _textTheme.bodyMedium?.copyWith(
          color: AppColors.bodyLarge,
        ),

        bodySmall: _textTheme.bodyMedium?.copyWith(
          color: AppColors.bodySmall,
        ),
        titleMedium: _textTheme.titleMedium?.copyWith(
          color: AppColors.titleMedium,
        ),
        // for title of widget
        labelLarge: const TextStyle(
          color: AppColors.labelLarge,
        ),
        labelMedium: const TextStyle(
          fontSize: 14,
          color: AppColors.labelMedium,
        ),
        // for hint text of text field
        labelSmall: _textTheme.labelSmall?.copyWith(
          color: AppColors.labelSmall,
        ),
      );

  ThemeData get themeDataDark {
    return ThemeData(
      brightness: Brightness.dark,
    );
  }

  TextTheme get _textTheme {
    switch (locale.languageCode) {
      case codeEn:
        return ThemeData.light().textTheme;
      case codeAr:
        return arabicTextTheme;
      default:
        return ThemeData.light().textTheme;
    }
  }
}
