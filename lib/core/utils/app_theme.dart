import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  // ── Light Theme ──
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.surfaceColor,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        surface: AppColors.whiteColor,
        error: AppColors.dangerColor,
        onPrimary: AppColors.whiteColor,
        onSecondary: AppColors.whiteColor,
        onSurface: AppColors.textBodyColor,
      ),

      // Design System
      cardTheme: CardThemeData(
        color: AppColors.whiteColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppColors.radiusMd)),
          side: BorderSide(color: AppColors.borderColor),
        ),
      ),

      // App Bar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimaryColor),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimaryColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: AppColors.borderLightColor,
        thickness: 1,
      ),
    );
  }

  // ── Dark Theme ──
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryLightColor,
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryLightColor,
        secondary: AppColors.secondaryColor,
        surface: AppColors.darkSurfaceColor,
        error: AppColors.dangerColor,
        onPrimary: AppColors.whiteColor,
        onSecondary: AppColors.whiteColor,
        onSurface: AppColors.darkTextPrimary,
      ),

      cardTheme: CardThemeData(
        color: AppColors.darkSurfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppColors.radiusMd)),
          side: BorderSide(color: AppColors.darkBorderColor),
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkSurfaceColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.darkTextPrimary),
        titleTextStyle: TextStyle(
          color: AppColors.darkTextPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorderColor,
        thickness: 1,
      ),
    );
  }
}
