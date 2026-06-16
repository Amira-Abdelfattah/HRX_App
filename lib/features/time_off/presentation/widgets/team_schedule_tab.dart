import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class TeamScheduleTab extends StatelessWidget {
  final List employees;

  const TeamScheduleTab({super.key, required this.employees});

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
            'Team\'s Upcoming Time Off',
            style: AppStyles.semi18PrimaryDark(context: context),
          ),
          SizedBox(height: 8.h),
          Text(
            'See who\'s out and plan accordingly',
            style: AppStyles.regular12Grey(context: context),
          ),
          SizedBox(height: 24.h),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 1,
            childAspectRatio: 4,
            mainAxisSpacing: 16.h,
            children: [
              _buildTeamMemberCard(
                context,
                'Sarah Johnson',
                'Annual Leave',
                'Jun 15 - Jun 19',
                'SJ',
                Colors.teal,
              ),
              _buildTeamMemberCard(
                context,
                'Michael Chen',
                'Sick Leave',
                'Jun 10 - Jun 10',
                'MC',
                Colors.pink,
              ),
              _buildTeamMemberCard(
                context,
                'Emma Williams',
                'Personal Leave',
                'Jul 01 - Jul 02',
                'EW',
                Colors.orange,
              ),
              _buildTeamMemberCard(
                context,
                'James Brown',
                'Annual Leave',
                'Jul 14 - Jul 18',
                'JB',
                Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMemberCard(
    BuildContext context,
    String name,
    String type,
    String date,
    String initials,
    Color avatarColor,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceLightColor
            : AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderColor.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: avatarColor,
            radius: 20.r,
            child: Text(
              initials,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppStyles.semi14PrimaryDark(context: context),
                ),
                Text(
                  '$type • $date',
                  style: AppStyles.regular10Grey(context: context),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'Approved',
              style: AppStyles.bold10Grey(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

