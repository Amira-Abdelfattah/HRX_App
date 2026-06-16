import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'chart_data.dart';

class ReusableBarChart extends StatelessWidget {
  final List<List<ChartData>> dataSeries;
  final List<String>? seriesNames;
  final List<Color>? colors;
  final List<LinearGradient>? gradients;
  final bool isHorizontal;
  final bool showYAxis;

  const ReusableBarChart({
    super.key,
    required this.dataSeries,
    this.seriesNames,
    this.colors,
    this.gradients,
    this.isHorizontal = false,
    this.showYAxis = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.zero,
      legend: seriesNames != null
          ? Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: AppStyles.regular10Grey(context: context),
            )
          : const Legend(isVisible: false),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: AppStyles.regular10Grey(context: context),
      ),
      primaryYAxis: NumericAxis(
        isVisible: showYAxis,
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
        if (isHorizontal) {
          return BarSeries<ChartData, String>(
            name: seriesNames?[index],
            dataSource: dataSeries[index],
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            color:
                colors?[index] ??
                (isDark ? AppColors.accentColor : AppColors.primaryColor),
            gradient: gradients != null ? gradients![index] : null,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(8.r)),
          );
        } else {
          return ColumnSeries<ChartData, String>(
            name: seriesNames?[index],
            dataSource: dataSeries[index],
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            color:
                colors?[index] ??
                (isDark ? AppColors.accentColor : AppColors.primaryColor),
            gradient: gradients != null ? gradients![index] : null,
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
          );
        }
      }),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
}
