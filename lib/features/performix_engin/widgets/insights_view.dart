import 'package:easy_localization/easy_localization.dart';
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
                context,
                'top_dept_month'.tr(),
                'eng_team_achieved'.tr(),
                const Color(0xFFDCFCE7),
                const Color(0xFF166534),
                Icons.emoji_events_outlined,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildInfoCard(
                context,
                'performance_drop_alert'.tr(),
                'three_employees_declining'.tr(),
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
                context,
                'q2_goal_progress'.tr(),
                'company_wide_target'.tr(),
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
          'department_performance'.tr(),
          style: AppStyles.bold20PrimaryDark(
            context: context,
            color: isDark ? Colors.white : AppColors.primaryColor,
          ).copyWith(fontSize: 18.sp),
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
              context,
              isDark,
              'engineering'.tr(),
              '90',
              'employees_count'.tr(args: ['45']),
              'top_employee'.tr(args: ['Sarah Johnson']),
              true,
            ),
            _buildDeptCard(
              context,
              isDark,
              'product'.tr(),
              '87',
              'employees_count'.tr(args: ['28']),
              'top_employee'.tr(args: ['Michael Chen']),
              true,
            ),
            _buildDeptCard(
              context,
              isDark,
              'design'.tr(),
              '88',
              'employees_count'.tr(args: ['22']),
              'top_employee'.tr(args: ['Emma Williams']),
              false,
            ),
            _buildDeptCard(
              context,
              isDark,
              'sales'.tr(),
              '84',
              'employees_count'.tr(args: ['38']),
              'top_employee'.tr(args: ['David Lee']),
              false,
            ),
          ],
        ),

        SizedBox(height: 32.h),
        _buildDetailedAlertsSection(context, isDark),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context,
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

  Widget _buildDeptCard(BuildContext context,
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
                  context: context,
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
              context: context,
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text('avg_score'.tr(),
              style: AppStyles.regular10Grey(context: context)),
          SizedBox(height: 6.h),
          Text(employees, style: AppStyles.regular10Grey(context: context)),
          Text(
            top,
            style: AppStyles.regular10Grey(
              context: context,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedAlertsSection(BuildContext context, bool isDark) {
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
                'performance_alerts'.tr(),
                style: AppStyles.bold20PrimaryDark(
                  context: context,
                  color: isDark ? Colors.white : AppColors.primaryColor,
                ).copyWith(fontSize: 18.sp),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          _buildDetailedAlertTile(
            context,
            'James Brown',
            'james_brown_issue'.tr(),
            'james_brown_action'.tr(),
            Colors.red,
            'high'.tr(),
          ),
          _buildDetailedAlertTile(
            context,
            'Lisa Anderson',
            'lisa_anderson_issue'.tr(),
            'lisa_anderson_action'.tr(),
            Colors.orange,
            'medium'.tr(),
          ),
          _buildDetailedAlertTile(
            context,
            'Alex Thompson',
            'alex_thompson_issue'.tr(),
            'alex_thompson_action'.tr(),
            Colors.red,
            'high'.tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedAlertTile(BuildContext context,
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
              Text(
                  name, style: AppStyles.medium14PrimaryDark(context: context)),
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
          Text(issue, style: AppStyles.regular12Grey(context: context)),
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
