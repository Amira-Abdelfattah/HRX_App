import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ChartContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget chart;
  final double? height;

  const ChartContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.chart,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderColor.withValues(alpha: 0.3),
        ),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.semi18PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text(subtitle, style: AppStyles.regular12Grey()),
          SizedBox(height: 20.h),
          SizedBox(height: height ?? 220.h, child: chart),
        ],
      ),
    );
  }
}
