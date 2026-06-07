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
        // Navy
        secondary: AppColors.secondaryColor,
        surface: AppColors.whiteColor,
        error: AppColors.dangerColor,
        onPrimary: AppColors.whiteColor,
        onSecondary: AppColors.whiteColor,
        onSurface: AppColors.blackColor, // Black text
      ),

      cardTheme: CardThemeData(
        color: AppColors.whiteColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppColors.radiusMd)),
          side: BorderSide(color: AppColors.borderColor),
        ),
      ),
    );
  }

  // ── Dark Theme ──
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.accentColor,
      // Gold (Dark Navy becomes Gold)
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentColor,
        // Gold
        secondary: AppColors.secondaryColor,
        surface: AppColors.darkSurfaceColor,
        error: AppColors.dangerColor,
        onPrimary: AppColors.darkBackgroundColor,
        onSecondary: AppColors.whiteColor,
        onSurface: AppColors.whiteColor, // White text
      ),

      cardTheme: CardThemeData(
        color: AppColors.darkSurfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppColors.radiusMd)),
          side: BorderSide(color: AppColors.darkBorderColor),
        ),
      ),
    );
  }
}
