import 'package:flutter/material.dart';

import '../../widgets/charts/chart_container.dart';
import '../../widgets/charts/chart_data.dart';
import '../../widgets/charts/reusable_bar_chart.dart';

class DepartmentPerformanceChart extends StatelessWidget {
  const DepartmentPerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'Department Performance',
      subtitle: 'Current month rankings',
      height: 300,
      chart: ReusableBarChart(
        dataSeries: [
          [
            ChartData('Engineering', 92),
            ChartData('Sales', 85),
            ChartData('Marketing', 78),
            ChartData('HR', 88),
            ChartData('Finance', 82),
          ],
        ],
        isHorizontal: true,
      ),
    );
  }
}
