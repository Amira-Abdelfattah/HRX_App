import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/stat_card.dart';

class AnalyticsStatsSection extends StatelessWidget {
  const AnalyticsStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildStatItem(
              title: 'Total Headcount',
              value: '1,247',
              trend: '↑ 12% from last quarter',
              isPositive: true,
              icon: Icons.people_outline,
              color: Colors.blue,
            ),
            SizedBox(width: 16.w),
            _buildStatItem(
              title: 'Attrition Rate',
              value: '2.1%',
              trend: '↓ 0.5% from last quarter',
              isPositive: true,
              icon: Icons.trending_down,
              color: Colors.redAccent,
            ),
            SizedBox(width: 16.w),
            _buildStatItem(
              title: 'New Hires',
              value: '67',
              trend: '↑ 10% from Q1',
              isPositive: true,
              icon: Icons.person_add_outlined,
              color: Colors.green,
            ),
            SizedBox(width: 16.w),
            _buildStatItem(
              title: 'Avg. Tenure',
              value: '3.2 yrs',
              trend: 'Company average',
              isPositive: true,
              icon: Icons.timer_outlined,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required String title,
    required String value,
    required String trend,
    required bool isPositive,
    required IconData icon,
    required Color color,
  }) {
    return SizedBox(
      width: 180.w,
      child: StatCard(
        title: title,
        value: value,
        trend: trend,
        isPositive: isPositive,
        icon: icon,
        color: color,
      ),
    );
  }
}
