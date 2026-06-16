import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderLightColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'recent_activity'.tr(),
            style: AppStyles.semi18PrimaryDark(
              context: context,
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text('latest_updates'.tr(),
              style: AppStyles.regular12Grey(context: context)),
          SizedBox(height: 16.h),
          _buildActivityItem(
            context,
            Icons.person_add_outlined,
            'activity_new_employee_title'.tr(),
            'activity_new_employee_desc'.tr(),
            'hours_ago'.tr(args: ['2']),
            Colors.green,
          ),
          _buildActivityItem(
            context,
            Icons.warning_amber_rounded,
            'activity_performance_alert_title'.tr(),
            'activity_performance_alert_desc'.tr(),
            'hours_ago'.tr(args: ['4']),
            Colors.orange,
          ),
          _buildActivityItem(
            context,
            Icons.check_circle_outline,
            'activity_leave_approved_title'.tr(),
            'activity_leave_approved_desc'.tr(),
            'hours_ago'.tr(args: ['6']),
            Colors.blue,
          ),
          _buildActivityItem(
            context,
            Icons.access_time_outlined,
            'activity_pending_reviews_title'.tr(),
            'activity_pending_reviews_desc'.tr(),
            'day_ago'.tr(),
            Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    String time,
    Color color,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.medium14PrimaryDark(
                    context: context,
                    color: isDark ? Colors.white : AppColors.primaryColor,
                  ),
                ),
                Text(subtitle,
                    style: AppStyles.regular12Grey(context: context)),
                Text(time, style: AppStyles.light12Grey(context: context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
