import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class DepartmentPerformanceChart extends StatelessWidget {
  const DepartmentPerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<_DeptData> data = [
      _DeptData('Engineering', 92),
      _DeptData('Sales', 85),
      _DeptData('Marketing', 78),
      _DeptData('HR', 88),
      _DeptData('Finance', 82),
    ];

    return Container(
      padding: EdgeInsets.all(12.w),
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
            'Department Performance',
            style: AppStyles.semi18PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text('Current month rankings', style: AppStyles.regular12Grey()),
          SizedBox(height: 20.h),
          SizedBox(
            height: 250.h,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: AppStyles.regular12Grey(),
                axisLine: const AxisLine(width: 0),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 110,
                interval: 25,
                majorGridLines: MajorGridLines(
                  width: 1,
                  color: isDark
                      ? AppColors.darkBorderColor
                      : AppColors.borderLightColor,
                  dashArray: const <double>[5, 5],
                ),
                labelStyle: AppStyles.regular10Grey(),
                axisLine: const AxisLine(width: 0),
              ),
              series: <CartesianSeries<_DeptData, String>>[
                BarSeries<_DeptData, String>(
                  dataSource: data,
                  xValueMapper: (_DeptData d, _) => d.department,
                  yValueMapper: (_DeptData d, _) => d.score,
                  color: isDark
                      ? AppColors.accentColor
                      : AppColors.primaryColor,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(8.r),
                  ),
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.inside,
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DeptData {
  _DeptData(this.department, this.score);

  final String department;
  final double score;
}
