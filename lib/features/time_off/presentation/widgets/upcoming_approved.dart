import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/core/utils/app_colors.dart';
import 'package:hrx_app/core/utils/app_styles.dart';

class UpcomingApproved extends StatelessWidget {
  const UpcomingApproved({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isDark ? null : AppColors.shadowSm,
        border: isDark ? Border.all(color: AppColors.darkBorderColor) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'UPCOMING APPROVED',
            style: AppStyles.bold10Grey(
              color: isDark ? AppColors.darkTextBody : AppColors.textMutedColor,
            ),
          ),
          SizedBox(height: 16.h),
          _buildUpcomingItem(
            context,
            title: 'Annual Leave',
            date: 'Jun 15, 2026 - Jun 19, 2026',
            days: '5d',
            icon: Icons.calendar_month,
            color: Colors.blue,
          ),
          SizedBox(height: 12.h),
          _buildUpcomingItem(
            context,
            title: 'Sick Leave',
            date: 'May 20, 2026 - May 21, 2026',
            days: '2d',
            icon: Icons.sick_outlined,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingItem(
    BuildContext context, {
    required String title,
    required String date,
    required String days,
    required IconData icon,
    required Color color,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceLightColor
            : AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: color, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.semi14PrimaryDark(
                    color: isDark
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                  ),
                ),
                Text(
                  date,
                  style: AppStyles.regular10Grey(
                    color: isDark
                        ? AppColors.darkTextBody
                        : AppColors.textMutedColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(days, style: AppStyles.bold10Grey(color: color)),
          ),
        ],
      ),
    );
  }
}
