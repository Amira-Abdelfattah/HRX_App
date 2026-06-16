import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/charts/chart_container.dart';
import '../../widgets/charts/chart_data.dart';
import '../../widgets/charts/reusable_area_chart.dart';
import '../../widgets/charts/reusable_bar_chart.dart';
import '../../widgets/charts/reusable_line_chart.dart';
import '../../widgets/charts/reusable_pie_chart.dart';

class AnalyticsChartsSection extends StatelessWidget {
  const AnalyticsChartsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Performance Trend
        ChartContainer(
          title: 'performance_trend'.tr(),
          subtitle: 'performance_trend_subtitle'.tr(),
          chart: ReusableAreaChart(
            dataSource: [
              ChartData('Jan'.tr(), 82),
              ChartData('Feb'.tr(), 84),
              ChartData('Mar'.tr(), 83),
              ChartData('Apr'.tr(), 86),
              ChartData('May'.tr(), 88),
              ChartData('Jun'.tr(), 90),
            ],
            color: const Color(0xFF0BC6B3),
          ),
        ),
        SizedBox(height: 16.h),

        // Attrition vs Hiring
        ChartContainer(
          title: 'attrition_vs_hiring'.tr(),
          subtitle: 'monthly_comparison'.tr(),
          chart: ReusableLineChart(
            dataSeries: [
              [
                ChartData('Jan'.tr(), 4),
                ChartData('Feb'.tr(), 5),
                ChartData('Mar'.tr(), 5),
                ChartData('Apr'.tr(), 4),
                ChartData('May'.tr(), 3),
                ChartData('Jun'.tr(), 4),
              ],
              [
                ChartData('Jan'.tr(), 9),
                ChartData('Feb'.tr(), 12),
                ChartData('Mar'.tr(), 15),
                ChartData('Apr'.tr(), 10),
                ChartData('May'.tr(), 14),
                ChartData('Jun'.tr(), 16),
              ],
            ],
            seriesNames: [
              'attrition_percent'.tr(),
              'new_hires'.tr(),
            ],
            colors: const [Colors.redAccent, Colors.green],
          ),
        ),
        SizedBox(height: 16.h),

        // Employee Distribution
        ChartContainer(
          title: 'employee_distribution'.tr(),
          subtitle: 'by_department'.tr(),
          chart: ReusablePieChart(
            dataSource: [
              ChartData('engineering'.tr(), 35, Colors.blue),
              ChartData('sales'.tr(), 20, Colors.orange),
              ChartData('marketing'.tr(), 15, Colors.purple),
              ChartData('hr'.tr(), 10, Colors.red),
              ChartData('finance'.tr(), 12, Colors.green),
              ChartData('product'.tr(), 8, Colors.teal),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Attendance Rate
        ChartContainer(
          title: 'attendance_rate'.tr(),
          subtitle: 'last_4_weeks'.tr(),
          chart: ReusableBarChart(
            dataSeries: [
              [
                ChartData('week_1'.tr(), 94),
                ChartData('week_2'.tr(), 95),
                ChartData('week_3'.tr(), 93),
                ChartData('week_4'.tr(), 96),
              ],
            ],
            colors: const [Colors.indigo],
          ),
        ),
      ],
    );
  }
}
