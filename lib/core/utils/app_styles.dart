import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import 'app_colors.dart';

class AppStyles {
  // Helper to get adaptive colors based on current theme
  static Color get _adaptivePrimaryDark {
    final context = navigatorKey.currentContext;
    if (context != null && Theme.of(context).brightness == Brightness.dark) {
      return AppColors.accentColor; // Navy becomes Gold in Dark Mode
    }
    return AppColors.primaryDarkColor; // Navy in Light Mode
  }

  static Color get _adaptiveBlack {
    final context = navigatorKey.currentContext;
    if (context != null && Theme.of(context).brightness == Brightness.dark) {
      return AppColors.whiteColor; // Black becomes White in Dark Mode
    }
    return AppColors.blackColor; // Black in Light Mode
  }

  static TextStyle regular12PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle regular11SalePrice({Color? color}) => GoogleFonts.poppins(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle regular14PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle regular18White = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );

  static TextStyle regular18Primary({Color? color}) => GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color:
        color ??
        (navigatorKey.currentContext != null &&
                Theme.of(navigatorKey.currentContext!).brightness ==
                    Brightness.dark
            ? AppColors.accentColor
            : AppColors.primaryColor),
  );

  static TextStyle light16White = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.whiteColor,
  );

  static TextStyle regular14SearchHint({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: color ?? AppColors.hintTextColor,
  );

  static TextStyle light18HintText({Color? color}) => GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w300,
    color: color ?? AppColors.hintTextColor,
  );

  static TextStyle semi16TextWhite = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static TextStyle semi20Primary({Color? color}) => GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color:
        color ??
        (navigatorKey.currentContext != null &&
                Theme.of(navigatorKey.currentContext!).brightness ==
                    Brightness.dark
            ? AppColors.accentColor
            : AppColors.primaryColor),
  );

  static TextStyle semi24White = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static TextStyle medium18White = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static TextStyle medium18Black({Color? color}) => GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: color ?? _adaptiveBlack,
  );

  static TextStyle medium18PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle medium20White = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static TextStyle medium14Category({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle medium14LightPrimary({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.textSubtleColor,
  );

  static TextStyle medium14PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle bold28Primary({Color? color}) => GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color:
        color ??
        (navigatorKey.currentContext != null &&
                Theme.of(navigatorKey.currentContext!).brightness ==
                    Brightness.dark
            ? AppColors.accentColor
            : AppColors.primaryColor),
  );

  static TextStyle bold32PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle semi24PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle semi20PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle bold20PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle semi18PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle semi16PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle medium16PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle bold36PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle bold32PrimaryDarkNumber({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: color ?? _adaptivePrimaryDark,
      );

  static TextStyle bold28PrimaryDarkNumber({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: color ?? _adaptivePrimaryDark,
      );

  static TextStyle regular14Grey({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.textMutedColor,
  );

  static TextStyle medium14Grey({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.textMutedColor,
  );

  static TextStyle regular12Grey({Color? color}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.textMutedColor,
  );

  static TextStyle semi14PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle semi13PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle regular14Black({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: color ?? _adaptiveBlack,
  );

  static TextStyle regular13Black({Color? color}) => GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: color ?? _adaptiveBlack,
  );

  static TextStyle medium14Green({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.successColor,
  );

  static TextStyle medium14Red({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.dangerColor,
  );

  static TextStyle semi16White = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static TextStyle medium16White = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static TextStyle semi14White = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static TextStyle regular16PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: color ?? _adaptivePrimaryDark,
  );

  static TextStyle medium16PrimaryDarkText({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: color ?? _adaptivePrimaryDark,
      );

  static TextStyle semi16PrimaryMenu({Color? color}) => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color:
        color ??
        (navigatorKey.currentContext != null &&
                Theme.of(navigatorKey.currentContext!).brightness ==
                    Brightness.dark
            ? AppColors.accentColor
            : AppColors.primaryColor),
  );

  static TextStyle medium14PrimaryDarkLabel({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color ?? _adaptivePrimaryDark,
      );

  static TextStyle regular14PrimaryDarkLabel({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark,
      );

  static TextStyle regular16PrimaryDarkInput({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark,
      );

  static TextStyle regular14PrimaryDarkInput({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark,
      );

  static TextStyle light12Grey({Color? color}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
    color: color ?? AppColors.textMutedColor,
  );

  static TextStyle regular12GreyHint({Color? color}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.hintTextColor,
  );

  static TextStyle light14Grey({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: color ?? AppColors.textMutedColor,
  );

  static TextStyle regular12PrimaryDarkSub({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark,
      );

  static TextStyle medium12Grey({Color? color}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.textMutedColor,
  );

  static TextStyle medium12Green({Color? color}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.successColor,
  );

  static TextStyle medium12Orange({Color? color}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.warningColor,
  );

  static TextStyle semi12White = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static TextStyle regular10Grey({Color? color}) => GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.textMutedColor,
  );

  static TextStyle regular11Grey({Color? color}) => GoogleFonts.poppins(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.textMutedColor,
  );

  static TextStyle medium14PrimaryDarkName({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color ?? _adaptivePrimaryDark,
      );

  static TextStyle regular12PrimaryDarkRole({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark,
      );
}
