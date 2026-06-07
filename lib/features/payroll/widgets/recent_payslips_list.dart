import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widgets/status_badge.dart';

class RecentPayslipsList extends StatelessWidget {
  const RecentPayslipsList({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderColor.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Payslips',
            style: AppStyles.semi18PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 16.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 20.w,
              horizontalMargin: 0,
              columns: const [
                DataColumn(label: Text('Employee')),
                DataColumn(label: Text('Department')),
                DataColumn(label: Text('Salary')),
                DataColumn(label: Text('Bonus')),
                DataColumn(label: Text('Net Pay')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Action')),
              ],
              rows: [
                _buildRow(
                  'Sarah Johnson',
                  'EMP-1247',
                  'Engineering',
                  '\$8,500',
                  '\$500',
                  '\$8,150',
                  'Paid',
                  AppColors.successColor,
                ),
                _buildRow(
                  'Michael Chen',
                  'EMP-1248',
                  'Product',
                  '\$9,000',
                  '\$600',
                  '\$8,700',
                  'Paid',
                  AppColors.successColor,
                ),
                _buildRow(
                  'James Brown',
                  'EMP-1250',
                  'Sales',
                  '\$7,000',
                  '\$300',
                  '\$6,600',
                  'Processing',
                  AppColors.warningColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildRow(
    String name,
    String id,
    String dept,
    String salary,
    String bonus,
    String net,
    String status,
    Color statusColor,
  ) {
    return DataRow(
      cells: [
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: AppStyles.medium14PrimaryDark()),
              Text(id, style: AppStyles.regular10Grey()),
            ],
          ),
        ),
        DataCell(Text(dept)),
        DataCell(Text(salary)),
        DataCell(Text(bonus)),
        DataCell(
          Text(net, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataCell(
          StatusBadge(
            text: status,
            color: statusColor,
            icon: statusColor == AppColors.successColor
                ? Icons.check_circle
                : Icons.warning_rounded,
          ),
        ),
        DataCell(TextButton(onPressed: () {}, child: const Text('View Slip'))),
      ],
    );
  }
}
