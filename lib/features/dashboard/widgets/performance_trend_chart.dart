import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/charts/chart_container.dart';
import '../../widgets/charts/chart_data.dart';
import '../../widgets/charts/reusable_area_chart.dart';

class PerformanceTrendChart extends StatelessWidget {
  const PerformanceTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'performance_trend'.tr(),
      subtitle: 'performance_trend_subtitle'.tr(),
      chart: ReusableAreaChart(
        dataSource: [
          ChartData('Jan'.tr(), 72),
          ChartData('Feb'.tr(), 75),
          ChartData('Mar'.tr(), 80),
          ChartData('Apr'.tr(), 83),
          ChartData('May'.tr(), 87),
          ChartData('Jun'.tr(), 91),
        ],
      ),
    );
  }
}
