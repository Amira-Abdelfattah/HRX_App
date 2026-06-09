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
            'Recent Activity',
            style: AppStyles.semi18PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text('Latest updates', style: AppStyles.regular12Grey()),
          SizedBox(height: 16.h),
          _buildActivityItem(
            context,
            Icons.person_add_outlined,
            'New Employee Joined',
            'Sarah Johnson joined as Senior Developer',
            '2 hours ago',
            Colors.green,
          ),
          _buildActivityItem(
            context,
            Icons.warning_amber_rounded,
            'Performance Alert',
            '3 employees showing declining performance',
            '4 hours ago',
            Colors.orange,
          ),
          _buildActivityItem(
            context,
            Icons.check_circle_outline,
            'Leave Approved',
            'Approved 5 leave requests',
            '6 hours ago',
            Colors.blue,
          ),
          _buildActivityItem(
            context,
            Icons.access_time_outlined,
            'Pending Reviews',
            '12 Performance reviews due this week',
            '1 day ago',
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
              color: color.withOpacity(0.1),
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
                    color: isDark ? Colors.white : AppColors.primaryColor,
                  ),
                ),
                Text(subtitle, style: AppStyles.regular12Grey()),
                Text(time, style: AppStyles.light12Grey()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
