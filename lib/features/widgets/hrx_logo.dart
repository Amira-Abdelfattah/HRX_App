import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/core/utils/app_colors.dart';
import 'package:hrx_app/core/utils/app_styles.dart';

class HrxLogo extends StatelessWidget {
  final double fontSize;
  final Color? color;

  const HrxLogo({super.key, this.fontSize = 36, this.color});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryAccent =
        color ?? (isDark ? AppColors.accentColor : AppColors.accentDarkColor);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "HR",
              style: AppStyles.bold32PrimaryDark(
                context: context,
              ).copyWith(fontSize: fontSize.sp,
                color: color,
              ),
            ),
            Text(
              "X",
              style: AppStyles.bold32PrimaryDark(context: context).copyWith(
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
