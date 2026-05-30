import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/features/dashboard/widgets/attendance_productivity_chart.dart';
import 'package:hrx_app/features/dashboard/widgets/department_performance_chart.dart';
import 'package:hrx_app/features/dashboard/widgets/performance_trend_chart.dart';
import 'package:hrx_app/features/dashboard/widgets/quick_actions_section.dart';
import 'package:hrx_app/features/dashboard/widgets/recent_activity_section.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import 'widgets/stat_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard Overview',
            style: AppStyles.bold32PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text(
            'Welcome back! Here\'s the heartbeat of your organization.',
            style: AppStyles.regular14Grey(),
          ),
          SizedBox(height: 24.h),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 1.1,
            children: [
              StatCard(
                title: 'Total Employees',
                value: '1,247',
                trend: '12%',
                isPositive: true,
                icon: Icons.people_alt_rounded,
                color: Colors.blue.shade700,
              ),
              StatCard(
                title: 'Active Projects',
                value: '64',
                trend: '8%',
                isPositive: true,
                icon: Icons.work_rounded,
                color: Colors.purple.shade600,
              ),
              StatCard(
                title: 'Attendance Rate',
                value: '93.5%',
                trend: '2%',
                isPositive: false,
                icon: Icons.event_available_rounded,
                color: Colors.green.shade600,
              ),
              StatCard(
                title: 'Avg Performance',
                value: '87/100',
                trend: '5%',
                isPositive: true,
                icon: Icons.trending_up_rounded,
                color: Colors.orange.shade600,
              ),
            ],
          ),
          SizedBox(height: 24.h),
          const PerformanceTrendChart(),
          SizedBox(height: 16.h),
          const AttendanceProductivityChart(),
          SizedBox(height: 24.h),
          const DepartmentPerformanceChart(),
          SizedBox(height: 16.h),
          const RecentActivitySection(),
          SizedBox(height: 24.h),
          const QuickActionsSection(),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}