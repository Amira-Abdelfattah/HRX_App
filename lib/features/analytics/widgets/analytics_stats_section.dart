import 'package:easy_localization/easy_localization.dart';
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
              title: 'total_headcount'.tr(),
              value: '1,247',
              trend: 'trend_from_last_quarter'.tr(args: ['↑ 5.2%']),
              isPositive: true,
              icon: Icons.people_outline,
              color: Colors.blue,
            ),
            SizedBox(width: 16.w),
            _buildStatItem(
              title: 'attrition_rate'.tr(),
              value: '2.1%',
              trend: 'trend_from_last_quarter'.tr(args: ['↓ 0.5%']),
              isPositive: true,
              icon: Icons.trending_down,
              color: Colors.redAccent,
            ),
            SizedBox(width: 16.w),
            _buildStatItem(
              title: 'new_hires'.tr(),
              value: '67',
              trend: 'trend_from_q1'.tr(args: ['↑ 12%']),
              isPositive: true,
              icon: Icons.person_add_outlined,
              color: Colors.green,
            ),
            SizedBox(width: 16.w),
            _buildStatItem(
              title: 'avg_tenure'.tr(),
              value: 'years_short'.tr(args: ['3.2']),
              trend: 'company_average'.tr(),
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
