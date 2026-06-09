import 'package:flutter/material.dart';

import '../../widgets/charts/chart_container.dart';
import '../../widgets/charts/chart_data.dart';
import '../../widgets/charts/reusable_area_chart.dart';

class PerformanceTrendChart extends StatelessWidget {
  const PerformanceTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'Performance Trend',
      subtitle: 'Average employee performance over time',
      chart: ReusableAreaChart(
        dataSource: [
          ChartData('Jan', 72),
          ChartData('Feb', 75),
          ChartData('Mar', 80),
          ChartData('Apr', 83),
          ChartData('May', 87),
          ChartData('Jun', 91),
        ],
      ),
    );
  }
}
