import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/core/utils/app_colors.dart';
import 'package:hrx_app/core/utils/app_styles.dart';

class HrxLogo extends StatelessWidget {
  final double fontSize;

  const HrxLogo({super.key, this.fontSize = 36});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryAccent = isDark
        ? AppColors.accentColor
        : AppColors.accentDarkColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Performix",
          style: AppStyles.bold32PrimaryDark().copyWith(
            fontSize: fontSize.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.5,
            color: primaryAccent,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (fontSize * .33).w),
          child: Text(
            "|",
            style: AppStyles.light18HintText().copyWith(
              color: primaryAccent.withValues(alpha: 0.3),
              fontSize: (fontSize * .88).sp,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "HR",
              style: AppStyles.bold32PrimaryDark().copyWith(
                fontSize: fontSize.sp,
                color: primaryAccent,
              ),
            ),
            Text(
              "X",
              style: AppStyles.bold32PrimaryDark().copyWith(
                fontSize: fontSize.sp,
                color: primaryAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
