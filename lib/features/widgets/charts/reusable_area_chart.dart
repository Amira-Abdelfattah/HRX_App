import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'chart_data.dart';

class ReusableAreaChart extends StatelessWidget {
  final List<ChartData> dataSource;
  final Color color;

  const ReusableAreaChart({
    super.key,
    required this.dataSource,
    this.color = const Color(0xFF0BC6B3),
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.zero,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: AppStyles.regular10Grey(),
      ),
      primaryYAxis: NumericAxis(
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        labelStyle: AppStyles.regular10Grey(),
        majorGridLines: MajorGridLines(
          width: 1,
          color: AppColors.borderColor.withOpacity(0.1),
          dashArray: const <double>[5, 5],
        ),
      ),
      series: <CartesianSeries<ChartData, String>>[
        AreaSeries<ChartData, String>(
          dataSource: dataSource,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          color: color.withOpacity(0.1),
          borderColor: color,
          borderWidth: 2,
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), color.withOpacity(0.0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ],
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
}
