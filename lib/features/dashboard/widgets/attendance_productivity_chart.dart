import 'package:flutter/material.dart';

import '../../widgets/charts/chart_container.dart';
import '../../widgets/charts/chart_data.dart';
import '../../widgets/charts/reusable_bar_chart.dart';

class AttendanceProductivityChart extends StatelessWidget {
  const AttendanceProductivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'Attendance vs Productivity',
      subtitle: "This week's comparison",
      chart: ReusableBarChart(
        dataSeries: [
          [
            ChartData('Mon', 85),
            ChartData('Tue', 88),
            ChartData('Wed', 92),
            ChartData('Thu', 80),
            ChartData('Fri', 90),
          ],
          [
            ChartData('Mon', 75),
            ChartData('Tue', 82),
            ChartData('Wed', 88),
            ChartData('Thu', 78),
            ChartData('Fri', 85),
          ],
        ],
        seriesNames: ['Attendance', 'Productivity'],
        colors: [Color(0xFF0BC6B3), Color(0xFF0178FF)],
      ),
    );
  }
}
