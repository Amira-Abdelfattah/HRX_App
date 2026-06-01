import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData? icon;
  final Color? color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.color,
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
              : AppColors.borderLightColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (icon != null)
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: (color ?? AppColors.primaryColor).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color ?? AppColors.primaryColor,
                    size: 20.sp,
                  ),
                ),
            ],
          ),
          if (icon != null) SizedBox(height: 12.h),
          Text(title, style: AppStyles.regular12Grey()),
          SizedBox(height: 4.h),
          Text(
            value,
            style: AppStyles.bold28PrimaryDarkNumber(
              color: color ?? (isDark ? Colors.white : AppColors.primaryColor),
            ),
          ),
          if (subtitle != null) ...[
            SizedBox(height: 4.h),
            Text(
              subtitle!,
              style: AppStyles.medium12Green(
                color: color?.withOpacity(0.8) ?? AppColors.successColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
