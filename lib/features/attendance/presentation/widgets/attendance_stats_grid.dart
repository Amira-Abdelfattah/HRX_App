import 'package:easy_localization/easy_localization.dart';
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
        'title': 'present_today'.tr(),
        'value': '1,189',
        'subtitle': 'attendance_rate_stat'.tr(args: ['93.2%']),
        'icon': Icons.check_circle_outline_rounded,
        'color': AppColors.successColor,
      },
      {
        'title': 'late_arrivals'.tr(),
        'value': '23',
        'subtitle': 'of_total_stat'.tr(args: ['1.8%']),
        'icon': Icons.access_time_rounded,
        'color': AppColors.warningColor,
      },
      {
        'title': 'absent'.tr(),
        'value': '35',
        'subtitle': 'of_total_stat'.tr(args: ['2.8%']),
        'icon': Icons.highlight_off_rounded,
        'color': AppColors.dangerColor,
      },
      {
        'title': 'on_leave'.tr(),
        'value': '12',
        'subtitle': 'approved_leaves'.tr(),
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
