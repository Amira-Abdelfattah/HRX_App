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
          title: 'Performance Trend',
          subtitle: 'Company-wide average performance score',
          chart: ReusableAreaChart(
            dataSource: [
              ChartData('Jan', 82),
              ChartData('Feb', 84),
              ChartData('Mar', 83),
              ChartData('Apr', 86),
              ChartData('May', 88),
              ChartData('Jun', 90),
            ],
            color: const Color(0xFF0BC6B3),
          ),
        ),
        SizedBox(height: 16.h),

        // Attrition vs Hiring
        ChartContainer(
          title: 'Attrition vs Hiring',
          subtitle: 'Monthly comparison',
          chart: ReusableLineChart(
            dataSeries: [
              [
                ChartData('Jan', 4),
                ChartData('Feb', 5),
                ChartData('Mar', 5),
                ChartData('Apr', 4),
                ChartData('May', 3),
                ChartData('Jun', 4),
              ],
              [
                ChartData('Jan', 9),
                ChartData('Feb', 12),
                ChartData('Mar', 15),
                ChartData('Apr', 10),
                ChartData('May', 14),
                ChartData('Jun', 16),
              ],
            ],
            seriesNames: const ['Attrition %', 'New Hires'],
            colors: const [Colors.redAccent, Colors.green],
          ),
        ),
        SizedBox(height: 16.h),

        // Employee Distribution
        ChartContainer(
          title: 'Employee Distribution',
          subtitle: 'By department',
          chart: ReusablePieChart(
            dataSource: [
              ChartData('Engineering', 35, Colors.blue),
              ChartData('Sales', 20, Colors.orange),
              ChartData('Marketing', 15, Colors.purple),
              ChartData('HR', 10, Colors.red),
              ChartData('Finance', 12, Colors.green),
              ChartData('Product', 8, Colors.teal),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Attendance Rate
        ChartContainer(
          title: 'Attendance Rate',
          subtitle: 'Last 4 weeks',
          chart: ReusableBarChart(
            dataSeries: [
              [
                ChartData('Week 1', 94),
                ChartData('Week 2', 95),
                ChartData('Week 3', 93),
                ChartData('Week 4', 96),
              ],
            ],
            colors: const [Colors.indigo],
          ),
        ),
      ],
    );
  }
}
