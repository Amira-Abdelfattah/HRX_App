import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'navigator_key.dart';

class AppStyles {
  // Helper to get adaptive colors based on current theme
  static Color _adaptivePrimaryDark([BuildContext? context]) {
    final effectiveContext = context ?? navigatorKey.currentContext;
    if (effectiveContext != null) {
      return Theme
          .of(effectiveContext)
          .brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.primaryDarkColor;
    }
    return AppColors.primaryDarkColor;
  }

  static Color _adaptiveBlack([BuildContext? context]) {
    final effectiveContext = context ?? navigatorKey.currentContext;
    if (effectiveContext != null) {
      return Theme
          .of(effectiveContext)
          .brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.primaryDarkColor;
    }
    return AppColors.primaryDarkColor;
  }

  static Color _adaptiveGrey([BuildContext? context]) {
    final effectiveContext = context ?? navigatorKey.currentContext;
    if (effectiveContext != null) {
      return Theme
          .of(effectiveContext)
          .brightness == Brightness.dark
          ? AppColors.darkTextBody
          : AppColors.textMutedColor;
    }
    return AppColors.textMutedColor;
  }

  static TextStyle regular12PrimaryDark(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle regular14PrimaryDark(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle regular18White = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );

  static TextStyle semi16TextWhite = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static TextStyle semi20Primary({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
        color: color ?? ((context != null && Theme
            .of(context)
            .brightness == Brightness.dark) ? AppColors.whiteColor : AppColors
            .primaryColor),
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

  static TextStyle medium18Black({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
        color: color ?? _adaptiveBlack(context),
  );

  static TextStyle medium18PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle medium20White = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static TextStyle medium14Category({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle medium14PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle bold28Primary({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
        color: color ?? ((context != null && Theme
            .of(context)
            .brightness == Brightness.dark) ? AppColors.whiteColor : AppColors
            .primaryColor),
  );

  static TextStyle bold32PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle semi24PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle semi20PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle bold20PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle semi18PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle semi16PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle medium16PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle bold36PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle bold32PrimaryDarkNumber(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: color ?? _adaptivePrimaryDark(context),
      );

  static TextStyle bold28PrimaryDarkNumber(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: color ?? _adaptivePrimaryDark(context),
      );

  static TextStyle regular14Grey({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
        color: color ?? _adaptiveGrey(context),
  );

  static TextStyle medium14Grey({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
        color: color ?? _adaptiveGrey(context),
  );

  static TextStyle regular12Grey({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
        color: color ?? _adaptiveGrey(context),
  );

  static TextStyle semi14PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle semi13PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle regular14Black({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
        color: color ?? _adaptiveBlack(context),
  );

  static TextStyle regular13Black({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
        color: color ?? _adaptiveBlack(context),
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

  static TextStyle regular16PrimaryDark(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle medium16PrimaryDarkText(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: color ?? _adaptivePrimaryDark(context),
      );

  static TextStyle semi16PrimaryMenu({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle medium14PrimaryDarkLabel(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color ?? _adaptivePrimaryDark(context),
      );

  static TextStyle regular14PrimaryDarkLabel(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark(context),
      );

  static TextStyle regular16PrimaryDarkInput(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark(context),
      );

  static TextStyle regular14PrimaryDarkInput(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark(context),
      );

  static TextStyle light12Grey({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
        color: color ?? _adaptiveGrey(context),
  );

  static TextStyle regular12GreyHint({Color? color}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.hintTextColor,
  );

  static TextStyle light14Grey({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
        color: color ?? _adaptiveGrey(context),
  );

  static TextStyle regular12PrimaryDarkSub(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark(context),
      );

  static TextStyle medium12Grey({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
        color: color ?? _adaptiveGrey(context),
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

  static TextStyle semi12PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle regular10Grey({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
        color: color ?? _adaptiveGrey(context),
      );

  static TextStyle bold14PrimaryDark({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: color ?? _adaptivePrimaryDark(context),
  );

  static TextStyle bold10Grey({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
        color: color ?? _adaptiveGrey(context),
  );

  static TextStyle regular11Grey({BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
        color: color ?? _adaptiveGrey(context),
  );

  static TextStyle medium14PrimaryDarkName(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color ?? _adaptivePrimaryDark(context),
      );

  static TextStyle regular12PrimaryDarkRole(
      {BuildContext? context, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color ?? _adaptivePrimaryDark(context),
      );
}
