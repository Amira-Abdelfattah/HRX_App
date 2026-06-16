import 'package:easy_localization/easy_localization.dart';
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
            'recent_payslips'.tr(),
            style: AppStyles.semi18PrimaryDark(
              context: context,
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 16.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 20.w,
              horizontalMargin: 0,
              columns: [
                DataColumn(label: Text('employee'.tr())),
                DataColumn(label: Text('department'.tr())),
                DataColumn(label: Text('salary'.tr())),
                DataColumn(label: Text('bonus'.tr())),
                DataColumn(label: Text('net_pay'.tr())),
                DataColumn(label: Text('status'.tr())),
                DataColumn(label: Text('action'.tr())),
              ],
              rows: [
                _buildRow(
                  context,
                  'Sarah Johnson',
                  'EMP-1247',
                  'Engineering',
                  '\$8,500',
                  '\$500',
                  '\$8,150',
                  'paid'.tr(),
                  AppColors.successColor,
                ),
                _buildRow(
                  context,
                  'Michael Chen',
                  'EMP-1248',
                  'Product',
                  '\$9,000',
                  '\$600',
                  '\$8,700',
                  'paid'.tr(),
                  AppColors.successColor,
                ),
                _buildRow(
                  context,
                  'James Brown',
                  'EMP-1250',
                  'Sales',
                  '\$7,000',
                  '\$300',
                  '\$6,600',
                  'processing'.tr(),
                  AppColors.warningColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildRow(BuildContext context,
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
              Text(
                  name, style: AppStyles.medium14PrimaryDark(context: context)),
              Text(id, style: AppStyles.regular10Grey(context: context)),
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
        DataCell(TextButton(onPressed: () {}, child: Text('view_slip'.tr()))),
      ],
    );
  }
}

