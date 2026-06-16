import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/charts/chart_container.dart';
import '../../widgets/charts/chart_data.dart';
import '../../widgets/charts/reusable_bar_chart.dart';

class AttendanceProductivityChart extends StatelessWidget {
  const AttendanceProductivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'attendance_vs_productivity'.tr(),
      subtitle: "weeks_comparison".tr(),
      chart: ReusableBarChart(
        dataSeries: [
          [
            ChartData('Mon'.tr(), 85),
            ChartData('Tue'.tr(), 88),
            ChartData('Wed'.tr(), 92),
            ChartData('Thu'.tr(), 80),
            ChartData('Fri'.tr(), 90),
          ],
          [
            ChartData('Mon'.tr(), 75),
            ChartData('Tue'.tr(), 82),
            ChartData('Wed'.tr(), 88),
            ChartData('Thu'.tr(), 78),
            ChartData('Fri'.tr(), 85),
          ],
        ],
        seriesNames: ['attendance'.tr(), 'productivity'.tr()],
        colors: [Color(0xFF0BC6B3), Color(0xFF0178FF)],
      ),
    );
  }
}
