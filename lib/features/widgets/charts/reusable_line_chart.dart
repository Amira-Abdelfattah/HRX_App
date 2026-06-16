import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'chart_data.dart';

class ReusableLineChart extends StatelessWidget {
  final List<List<ChartData>> dataSeries;
  final List<String> seriesNames;
  final List<Color> colors;

  const ReusableLineChart({
    super.key,
    required this.dataSeries,
    required this.seriesNames,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.zero,
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        textStyle: AppStyles.regular10Grey(context: context),
      ),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: AppStyles.regular10Grey(context: context),
      ),
      primaryYAxis: NumericAxis(
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        labelStyle: AppStyles.regular10Grey(context: context),
        majorGridLines: MajorGridLines(
          width: 1,
          color: AppColors.borderColor.withValues(alpha: 0.1),
          dashArray: const <double>[5, 5],
        ),
      ),
      series: List.generate(dataSeries.length, (index) {
        return LineSeries<ChartData, String>(
          name: seriesNames[index],
          dataSource: dataSeries[index],
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          color: colors[index],
          markerSettings: const MarkerSettings(isVisible: true),
        );
      }),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
}
