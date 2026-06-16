import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/charts/chart_container.dart';
import '../../widgets/charts/chart_data.dart';
import '../../widgets/charts/reusable_bar_chart.dart';

class PayrollTrendChart extends StatelessWidget {
  const PayrollTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> data = [
      ChartData('Jan'.tr(), 150000),
      ChartData('Feb'.tr(), 155000),
      ChartData('Mar'.tr(), 160000),
      ChartData('Apr'.tr(), 165000),
      ChartData('May'.tr(), 168000),
      ChartData('Jun'.tr(), 170000),
    ];

    return ChartContainer(
      title: 'payroll_trend'.tr(),
      subtitle: 'monthly_payroll_expenses'.tr(),
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
