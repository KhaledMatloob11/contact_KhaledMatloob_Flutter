import 'package:contacts_app/utils/app_colors.dart';
import 'package:contacts_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const TextStyle _bodyLargeText = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.white,
      size: 24,
    ),
    textTheme: const TextTheme(
      bodyLarge: _bodyLargeText,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppStyles.hintTextStyle,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.white, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.red, width: 1.5),
      ),
    ),
  );
}