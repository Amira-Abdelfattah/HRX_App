import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class PerformanceTrendChart extends StatelessWidget {
  const PerformanceTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<_ChartData> data = [
      _ChartData('Jan', 72),
      _ChartData('Feb', 75),
      _ChartData('Mar', 80),
      _ChartData('Apr', 83),
      _ChartData('May', 87),
      _ChartData('Jun', 91),
    ];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderLightColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Trend',
            style: AppStyles.semi18PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text(
            'Average employee performance over time',
            style: AppStyles.regular12Grey(),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 200.h,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: AppStyles.regular10Grey(),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 100,
                interval: 25,
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                labelStyle: AppStyles.regular10Grey(),
                majorGridLines: MajorGridLines(
                  width: 1,
                  color: isDark
                      ? AppColors.darkBorderColor
                      : AppColors.borderLightColor,
                  dashArray: const <double>[5, 5],
                ),
              ),
              series: <CartesianSeries<_ChartData, String>>[
                AreaSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData d, _) => d.x,
                  yValueMapper: (_ChartData d, _) => d.y,
                  color: AppColors.successColor.withOpacity(0.1),
                  borderColor: AppColors.successColor,
                  borderWidth: 2,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.successColor.withOpacity(0.3),
                      AppColors.successColor.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ],
              tooltipBehavior: TooltipBehavior(enable: true),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
