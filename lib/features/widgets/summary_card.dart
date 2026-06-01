import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool isLarge;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isLarge ? 20.w : 16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: isDark ? AppColors.darkBorderColor : AppColors.borderColor),
        boxShadow: isDark ? [] : AppColors.shadowSm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: isLarge ? 24.sp : 20.sp),
          ),
          SizedBox(height: isLarge ? 24.h : 16.h),
          Text(
            title,
            style: AppStyles.regular12Grey(),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: AppStyles.bold28PrimaryDarkNumber(
              color: isLarge ? color : (isDark ? Colors.white : AppColors.primaryDarkColor),
            ).copyWith(fontSize: isLarge ? 32.sp : 24.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: AppStyles.regular11Grey(color: isLarge ? color.withOpacity(0.8) : null),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
