import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final IconData? icon;
  final bool isLarge;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    this.icon,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderColor.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20.sp),
            ),
            SizedBox(height: 12.h),
          ],
          Text(
            title,
            style: AppStyles.regular14Grey(),
          ),
          SizedBox(height: 8.h),
          Text(value, style: AppStyles.bold28PrimaryDarkNumber(color: color)),
          SizedBox(height: 4.h),
          Text(subtitle, style: AppStyles.regular12Grey()),
        ],
      ),
    );
  }
}
