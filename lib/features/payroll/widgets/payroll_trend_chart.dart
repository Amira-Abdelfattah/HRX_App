import 'package:flutter/material.dart';

import '../../widgets/charts/chart_container.dart';
import '../../widgets/charts/chart_data.dart';
import '../../widgets/charts/reusable_bar_chart.dart';

class PayrollTrendChart extends StatelessWidget {
  const PayrollTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> data = [
      ChartData('Jan', 150000),
      ChartData('Feb', 155000),
      ChartData('Mar', 160000),
      ChartData('Apr', 165000),
      ChartData('May', 168000),
      ChartData('Jun', 170000),
    ];

    return ChartContainer(
      title: 'Payroll Trend',
      subtitle: 'Monthly payroll expenses over time',
      chart: ReusableBarChart(
        dataSeries: [data],
        showYAxis: false,
        gradients: const [
          LinearGradient(
            colors: [Color(0xFF0D9488), Color(0xFF6366F1)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
