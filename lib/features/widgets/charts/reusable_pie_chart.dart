import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/app_styles.dart';
import 'chart_data.dart';

class ReusablePieChart extends StatelessWidget {
  final List<ChartData> dataSource;

  const ReusablePieChart({super.key, required this.dataSource});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      margin: EdgeInsets.zero,
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.right,
        textStyle: AppStyles.regular10Grey(),
      ),
      series: <CircularSeries>[
        PieSeries<ChartData, String>(
          dataSource: dataSource,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (ChartData data, _) => data.color,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            textStyle: AppStyles.regular10Grey(),
          ),
        ),
      ],
    );
  }
}
