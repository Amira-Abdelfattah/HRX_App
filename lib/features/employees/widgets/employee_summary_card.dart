import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class EmployeeSummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const EmployeeSummaryCard({
    super.key,
    required this.title,
    required this.value,
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
          Text(title, style: AppStyles.regular12Grey()),
          SizedBox(height: 4.h),
          Text(
            value,
            style: AppStyles.bold28PrimaryDarkNumber(
              color: color ?? (isDark ? Colors.white : AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
