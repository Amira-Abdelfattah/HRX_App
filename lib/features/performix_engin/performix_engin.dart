import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/features/performix_engin/widgets/insights_view.dart';
import 'package:hrx_app/features/performix_engin/widgets/performer_item.dart';
import 'package:hrx_app/features/performix_engin/widgets/performix_engine_header.dart';
import 'package:hrx_app/features/performix_engin/widgets/performix_engine_tabs.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class PerformixEngineScreen extends StatefulWidget {
  const PerformixEngineScreen({super.key});

  @override
  State<PerformixEngineScreen> createState() => _PerformixEngineScreenState();
}

class _PerformixEngineScreenState extends State<PerformixEngineScreen> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
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

          _activeTab == 0 ? _buildLeaderboard() : const InsightsView(),
        ],
      ),
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
          'Top Performers',
          style: AppStyles.semi18PrimaryDark(
            color: isDark ? Colors.white : AppColors.primaryColor,
          ),
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
            color: AppColors.textMutedColor.withOpacity(0.5),
          ),
          SizedBox(height: 16.h),
          Text(
            'Select an Employee',
            style: AppStyles.semi18PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Click on any employee to view their detailed performance breakdown',
            textAlign: TextAlign.center,
            style: AppStyles.regular12Grey(),
          ),
        ],
      ),
    );
  }
}
