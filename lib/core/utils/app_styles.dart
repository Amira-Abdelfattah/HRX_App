import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle regular12PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.primaryDarkColor,
  );

  static TextStyle regular11SalePrice({Color? color}) => GoogleFonts.poppins(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.primaryDarkColor,
  );

  static TextStyle regular14PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.primaryDarkColor,
  );
  static TextStyle regular18White = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );

  static TextStyle regular18Primary({Color? color}) => GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.primaryColor,
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
    color: color ?? AppColors.primaryColor,
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
    color: color ?? AppColors.blackColor,
  );

  static TextStyle medium18PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.primaryDarkColor,
  );
  static TextStyle medium20White = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static TextStyle medium14Category({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.primaryDarkColor,
  );

  static TextStyle medium14LightPrimary({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.textSubtleColor,
  );

  static TextStyle medium14PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.primaryDarkColor,
  );

  // ---- Logo ----
  static TextStyle bold28Primary({Color? color}) => GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: color ?? AppColors.primaryColor,
  );

  static TextStyle bold32PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: color ?? AppColors.primaryDarkColor,
  );

  // ---- Page Titles ----
  static TextStyle semi24PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.primaryDarkColor,
  );

  static TextStyle semi20PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.primaryDarkColor,
  );

  static TextStyle bold20PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: color ?? AppColors.primaryDarkColor,
  );

  // ---- Section Headers ----
  static TextStyle semi18PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.primaryDarkColor,
  );

  static TextStyle medium16PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.primaryDarkColor,
  );

  // ---- Large State Numbers ----
  static TextStyle bold36PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    color: color ?? AppColors.primaryDarkColor,
  );

  static TextStyle bold32PrimaryDarkNumber({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.primaryDarkColor,
      );

  static TextStyle bold28PrimaryDarkNumber({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.primaryDarkColor,
      );

  // ---- State Labels ----
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

  // ---- Table Content ----
  static TextStyle semi14PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.primaryDarkColor,
  );

  static TextStyle semi13PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.primaryDarkColor,
  );

  // ---- Table Cell Content ----
  static TextStyle regular14Black({Color? color}) => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.blackColor,
  );

  static TextStyle regular13Black({Color? color}) => GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.blackColor,
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

  // ---- Buttons ----
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

  // ---- Sidebar Menu ----
  static TextStyle regular16PrimaryDark({Color? color}) => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.primaryDarkColor,
  );

  static TextStyle medium16PrimaryDarkText({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.primaryDarkColor,
      );

  static TextStyle semi16PrimaryMenu({Color? color}) => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.primaryColor,
  );

  // ---- Form Controls ----
  static TextStyle medium14PrimaryDarkLabel({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.primaryDarkColor,
      );

  static TextStyle regular14PrimaryDarkLabel({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.primaryDarkColor,
      );

  // ---- Form Input Text ----
  static TextStyle regular16PrimaryDarkInput({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.primaryDarkColor,
      );

  static TextStyle regular14PrimaryDarkInput({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.primaryDarkColor,
      );

  // ---- Helper / Hint / Small Text ----
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

  // ---- Card Subtitles / Secondary Info ----
  static TextStyle regular12PrimaryDarkSub({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.primaryDarkColor,
      );

  static TextStyle medium12Grey({Color? color}) => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.textMutedColor,
  );

  // ---- Performance / Badge Text ----
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

  // ---- Chart / Axis Labels ----
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

  // ---- User Name ----
  static TextStyle medium14PrimaryDarkName({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.primaryDarkColor,
      );

  static TextStyle regular12PrimaryDarkRole({Color? color}) =>
      GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.primaryDarkColor,
      );
}