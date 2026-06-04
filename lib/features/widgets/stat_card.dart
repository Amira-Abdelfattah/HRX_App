import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String trend;
  final bool isPositive;
  final IconData icon;
  final Color color;
  final Color? trendColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.trend,
    this.isPositive = true,
    required this.icon,
    required this.color,
    this.trendColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20.sp),
          ),
          const Spacer(),
          Text(title, style: AppStyles.regular12Grey()),
          SizedBox(height: 4.h),
          Text(
            value,
            style: AppStyles.bold28PrimaryDarkNumber(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            trend,
            style: AppStyles.medium12Grey(
              color:
                  trendColor ??
                  (isPositive ? AppColors.successColor : AppColors.dangerColor),
            ),
          ),
        ],
      ),
    );
  }
}
