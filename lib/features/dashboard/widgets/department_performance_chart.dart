import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/charts/chart_container.dart';
import '../../widgets/charts/chart_data.dart';
import '../../widgets/charts/reusable_bar_chart.dart';

class DepartmentPerformanceChart extends StatelessWidget {
  const DepartmentPerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'department_performance'.tr(),
      subtitle: 'current_month_rankings'.tr(),
      height: 300,
      chart: ReusableBarChart(
        dataSeries: [
          [
            ChartData('engineering'.tr(), 92),
            ChartData('sales'.tr(), 85),
            ChartData('marketing'.tr(), 78),
            ChartData('hr'.tr(), 88),
            ChartData('finance'.tr(), 82),
          ],
        ],
        isHorizontal: true,
      ),
    );
  }
}
