import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../widgets/summary_card.dart';

class AttendanceStatsGrid extends StatelessWidget {
  const AttendanceStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> stats = [
      {
        'title': 'Present Today',
        'value': '1,189',
        'subtitle': '93.2% attendance rate',
        'icon': Icons.check_circle_outline_rounded,
        'color': AppColors.successColor,
      },
      {
        'title': 'Late Arrivals',
        'value': '23',
        'subtitle': '1.8% of total',
        'icon': Icons.access_time_rounded,
        'color': AppColors.warningColor,
      },
      {
        'title': 'Absent',
        'value': '35',
        'subtitle': '2.8% of total',
        'icon': Icons.highlight_off_rounded,
        'color': AppColors.dangerColor,
      },
      {
        'title': 'On Leave',
        'value': '12',
        'subtitle': 'Approved leaves',
        'icon': Icons.calendar_today_rounded,
        'color': AppColors.secondaryColor,
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < stats.length; i++) ...[
              SizedBox(
                width: 170.w,
                child: SummaryCard(
                  title: stats[i]['title'],
                  value: stats[i]['value'],
                  subtitle: stats[i]['subtitle'],
                  icon: stats[i]['icon'],
                  color: stats[i]['color'],
                  isLarge: false,
                ),
              ),
              if (i != stats.length - 1) SizedBox(width: 12.w),
            ],
          ],
        ),
      ),
    );
  }
}
