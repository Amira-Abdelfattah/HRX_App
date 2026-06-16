import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/features/performix_engin/widgets/insights_view.dart';
import 'package:hrx_app/features/performix_engin/widgets/performer_item.dart';
import 'package:hrx_app/features/performix_engin/widgets/performix_engine_header.dart';
import 'package:hrx_app/features/performix_engin/widgets/performix_engine_tabs.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/navigation_provider.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PerformixEngineScreen extends StatefulWidget {
  const PerformixEngineScreen({super.key});

  @override
  State<PerformixEngineScreen> createState() => _PerformixEngineScreenState();
}

class _PerformixEngineScreenState extends State<PerformixEngineScreen> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);
    final selectedEmployee = navProvider.selectedEmployee;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EngineHeader(),
          SizedBox(height: 20.h),
          PerformixEngineTabs(
            activeTab: _activeTab,
            onTabChanged: (index) => setState(() => _activeTab = index),
          ),
          SizedBox(height: 24.h),

          _activeTab == 0
              ? (selectedEmployee != null
                    ? _buildEmployeePerformanceDetail(selectedEmployee)
                    : _buildLeaderboard())
              : const InsightsView(),
        ],
      ),
    );
  }

  Widget _buildEmployeePerformanceDetail(Map<String, dynamic> employee) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
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
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor:
                    (employee['color'] as Color? ?? AppColors.primaryColor)
                        .withValues(alpha: 0.1),
                child: Text(
                  employee['init'] ?? 'U',
                  style: AppStyles.semi24White.copyWith(
                    color:
                        employee['color'] as Color? ?? AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee['name'] ?? 'Unknown',
                      style: AppStyles.bold20PrimaryDark(
                        color: isDark ? Colors.white : AppColors.primaryColor,
                      ).copyWith(fontSize: 18.sp),
                    ),
                    Text(
                      '${employee['role'] ?? 'Employee'} • ${employee['dept'] ?? 'General'}',
                      style: AppStyles.medium12Grey(),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.successColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'score'.tr(args: [employee['perf']?.toString() ?? '0']),
                  style: TextStyle(
                    color: AppColors.successColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'performance_breakdown'.tr(),
            style: AppStyles.semi16PrimaryMenu(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 16.h),
          _buildMetricRow('efficiency'.tr(), 0.85, Colors.blue),
          SizedBox(height: 12.h),
          _buildMetricRow('quality'.tr(), 0.92, Colors.green),
          SizedBox(height: 12.h),
          _buildMetricRow('timeliness'.tr(), 0.78, Colors.orange),
          SizedBox(height: 24.h),
          Center(
            child: TextButton(
              onPressed: () {
                Provider.of<NavigationProvider>(
                  context,
                  listen: false,
                ).selectEmployeeAndNavigate(
                  {},
                  4,
                ); // Reset to leaderboard or handle differently
              },
              child: Text(
                'view_full_leaderboard'.tr(),
                style: AppStyles.semi14PrimaryDark(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricRow(String label, double value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppStyles.regular12Grey()),
            Text('${(value * 100).toInt()}%', style: AppStyles.medium12Grey()),
          ],
        ),
        SizedBox(height: 8.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: color.withValues(alpha: 0.1),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8.h,
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboard() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, dynamic>> performers = [
      {
        'name': 'Sarah Johnson',
        'role': 'Senior Developer',
        'dept': 'Engineering',
        'score': '92',
        'trend': '+5',
        'color': const Color(0xFFEAB308),
      },
      {
        'name': 'Olivia Davis',
        'role': 'HR Specialist',
        'dept': 'HR',
        'score': '91',
        'trend': '+2',
        'color': const Color(0xFF94A3B8),
      },
      {
        'name': 'Emma Williams',
        'role': 'UX Designer',
        'dept': 'Design',
        'score': '90',
        'trend': '+4',
        'color': const Color(0xFFD97706),
      },
      {
        'name': 'Robert Garcia',
        'role': 'DevOps Engineer',
        'dept': 'Engineering',
        'score': '89',
        'trend': '+2',
        'color': Colors.grey.shade400,
      },
      {
        'name': 'Michael Chen',
        'role': 'Product Manager',
        'dept': 'Product',
        'score': '88',
        'trend': '+3',
        'color': Colors.grey.shade400,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'top_performers'.tr(),
          style: AppStyles.bold20PrimaryDark(
            color: isDark ? Colors.white : AppColors.primaryColor,
          ).copyWith(fontSize: 18.sp),
        ),
        SizedBox(height: 16.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: performers.length,
          itemBuilder: (context, index) {
            final p = performers[index];
            return PerformerItem(
              rank: index + 1,
              name: p['name'],
              role: p['role'],
              dept: p['dept'],
              score: p['score'],
              trend: p['trend'],
              rankColor: p['color'],
            );
          },
        ),
        SizedBox(height: 24.h),
        _buildSelectEmployeePlaceholder(isDark),
      ],
    );
  }

  Widget _buildSelectEmployeePlaceholder(bool isDark) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderLightColor,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.trending_up,
            size: 40.sp,
            color: AppColors.textMutedColor.withValues(alpha: 0.5),
          ),
          SizedBox(height: 16.h),
          Text(
            'select_employee'.tr(),
            style: AppStyles.bold20PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ).copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            'select_employee_desc'.tr(),
            textAlign: TextAlign.center,
            style: AppStyles.regular12Grey(),
          ),
        ],
      ),
    );
  }
}
