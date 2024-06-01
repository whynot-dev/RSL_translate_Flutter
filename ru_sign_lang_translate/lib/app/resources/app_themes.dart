import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primary,
   // accentColor: AppColors.accent,
    appBarTheme: AppBarTheme(color: AppColors.primary, systemOverlayStyle: SystemUiOverlayStyle.dark),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      brightness: Brightness.dark,
    ),
    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.accent,
      selectionColor: AppColors.accent,
      selectionHandleColor: AppColors.accent,
    ),
    indicatorColor: AppColors.accent,
    textTheme: TextTheme(
      subtitle1: const TextStyle(color: AppColors.inputText, fontSize: 18, fontWeight: FontWeight.w400),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: AppColors.inputLabel, fontSize: 16, fontWeight: FontWeight.w400),
      hintStyle: const TextStyle(color: AppColors.inputHint, fontSize: 18, fontWeight: FontWeight.w400),
    ),
    fontFamily: 'TTFirsNeue',
  );
}
