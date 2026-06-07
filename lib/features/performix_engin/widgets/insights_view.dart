import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class InsightsView extends StatelessWidget {
  const InsightsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInfoCard(
                'Top Department This Month',
                'Engineering team achieved 92% score',
                const Color(0xFFDCFCE7),
                const Color(0xFF166534),
                Icons.emoji_events_outlined,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildInfoCard(
                'Performance Drop Alert',
                '3 employees showing declining trend',
                const Color(0xFFFEF9C3),
                const Color(0xFF854D0E),
                Icons.warning_amber_rounded,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        Row(
          children: [
            Expanded(
              child: _buildInfoCard(
                'Q2 Goal Progress',
                'Company-wide target: 75% achieved',
                isDark
                    ? AppColors.darkSurfaceLightColor
                    : const Color(0xFFF1F5F9),
                isDark ? Colors.white : AppColors.primaryColor,
                Icons.track_changes,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAB308),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 24.h),
        Text(
          'Department Performance',
          style: AppStyles.semi18PrimaryDark(
            color: isDark ? Colors.white : AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 16.h),

        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 1.25,
          children: [
            _buildDeptCard(
              isDark,
              'Engineering',
              '90',
              '45 employees',
              'Top: Sarah Johnson',
              true,
            ),
            _buildDeptCard(
              isDark,
              'Product',
              '87',
              '28 employees',
              'Top: Michael Chen',
              true,
            ),
            _buildDeptCard(
              isDark,
              'Design',
              '88',
              '22 employees',
              'Top: Emma Williams',
              false,
            ),
            _buildDeptCard(
              isDark,
              'Sales',
              '84',
              '38 employees',
              'Top: David Lee',
              false,
            ),
          ],
        ),

        SizedBox(height: 32.h),
        _buildDetailedAlertsSection(isDark),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildInfoCard(
    String title,
    String sub,
    Color bgColor,
    Color textColor,
    IconData icon,
  ) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor, size: 18.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  sub,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: textColor.withValues(alpha: 0.8),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeptCard(
    bool isDark,
    String title,
    String score,
    String employees,
    String top,
    bool isUp,
  ) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderLightColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppStyles.medium14PrimaryDark(
                  color: isDark ? Colors.white : AppColors.primaryColor,
                ),
              ),
              Icon(
                isUp ? Icons.trending_up : Icons.remove,
                color: isUp ? Colors.green : Colors.grey,
                size: 14.sp,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            score,
            style: AppStyles.bold28PrimaryDarkNumber(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text('Average Score', style: AppStyles.regular10Grey()),
          SizedBox(height: 6.h),
          Text(employees, style: AppStyles.regular10Grey()),
          Text(
            top,
            style: AppStyles.regular10Grey(color: AppColors.secondaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedAlertsSection(bool isDark) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
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
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange,
                size: 20,
              ),
              SizedBox(width: 8.w),
              Text(
                'Performance Alerts',
                style: AppStyles.semi18PrimaryDark(
                  color: isDark ? Colors.white : AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          _buildDetailedAlertTile(
            'James Brown',
            'Performance score dropped 8% in last 30 days',
            'Suggested Action: Schedule 1-on-1 meeting',
            Colors.red,
            'HIGH',
          ),
          _buildDetailedAlertTile(
            'Lisa Anderson',
            'Attendance rate below target (85%)',
            'Suggested Action: Review attendance policy',
            Colors.orange,
            'MEDIUM',
          ),
          _buildDetailedAlertTile(
            'Alex Thompson',
            'Multiple missed deadlines (4 in last month)',
            'Suggested Action: Assess workload distribution',
            Colors.red,
            'HIGH',
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedAlertTile(
    String name,
    String issue,
    String action,
    Color color,
    String severity,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(12.r),
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: AppStyles.medium14PrimaryDark()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  severity,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(issue, style: AppStyles.regular12Grey()),
          SizedBox(height: 4.h),
          Text(
            action,
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
