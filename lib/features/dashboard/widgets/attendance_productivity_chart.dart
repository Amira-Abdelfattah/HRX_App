import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class AttendanceProductivityChart extends StatelessWidget {
  const AttendanceProductivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<_BarData> data = [
      _BarData('Mon', 85, 75),
      _BarData('Tue', 88, 82),
      _BarData('Wed', 92, 88),
      _BarData('Thu', 80, 78),
      _BarData('Fri', 90, 85),
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
            'Attendance vs Productivity',
            style: AppStyles.semi18PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text("This week's comparison", style: AppStyles.regular12Grey()),
          SizedBox(height: 20.h),
          SizedBox(
            height: 220.h,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                textStyle: AppStyles.regular10Grey(),
              ),
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: AppStyles.regular10Grey(),
              ),
              series: <CartesianSeries<_BarData, String>>[
                ColumnSeries<_BarData, String>(
                  name: 'Attendance',
                  dataSource: data,
                  xValueMapper: (_BarData d, _) => d.x,
                  yValueMapper: (_BarData d, _) => d.y1,
                  color: const Color(0xFF0BC6B3),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(6.r),
                  ),
                ),
                ColumnSeries<_BarData, String>(
                  name: 'Productivity',
                  dataSource: data,
                  xValueMapper: (_BarData d, _) => d.x,
                  yValueMapper: (_BarData d, _) => d.y2,
                  color: const Color(0xFF0178FF),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(6.r),
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

class _BarData {
  _BarData(this.x, this.y1, this.y2);

  final String x;
  final double y1;
  final double y2;
}
