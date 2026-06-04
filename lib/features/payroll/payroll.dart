import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_colors.dart';
import '../widgets/custom_page_header.dart';
import '../widgets/stat_card.dart';
import '../widgets/summary_card.dart';
import 'widgets/payroll_trend_chart.dart';
import 'widgets/recent_payslips_list.dart';

class PayrollScreen extends StatelessWidget {
  const PayrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPageHeader(
            title: 'Payroll Management',
            subtitle: 'Manage employee compensation and payslips',
            actionLabel: 'Export Payroll',
            actionIcon: Icons.file_upload_outlined,
            onActionPressed: () {},
          ),
          SizedBox(height: 24.h),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 1.2,
            children: [
              StatCard(
                title: 'Total Payroll',
                value: '\$495K',
                trend: 'This month',
                icon: Icons.attach_money_rounded,
                color: Colors.blue.shade700,
                trendColor: Colors.green,
              ),
              StatCard(
                title: 'Paid',
                value: '1,189',
                trend: 'Employees',
                icon: Icons.check_circle_outline_rounded,
                color: Colors.green.shade600,
                trendColor: Colors.grey,
              ),
              StatCard(
                title: 'Processing',
                value: '58',
                trend: 'Payslips',
                icon: Icons.access_time_rounded,
                color: Colors.orange.shade600,
                trendColor: Colors.grey,
              ),
              StatCard(
                title: 'Avg Salary',
                value: '\$8,200',
                trend: '1.2% from last month',
                icon: Icons.trending_up_rounded,
                color: Colors.teal.shade600,
                trendColor: Colors.green,
              ),
            ],
          ),
          SizedBox(height: 24.h),

          const PayrollTrendChart(),
          SizedBox(height: 24.h),
          const RecentPayslipsList(),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: SummaryCard(
                  title: 'Total Salaries',
                  value: '\$425,800',
                  subtitle: 'Base compensation',
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: SummaryCard(
                  title: 'Total Bonuses',
                  value: '\$45,200',
                  subtitle: 'Performance bonus',
                  color: AppColors.successColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SummaryCard(
            title: 'Total Deductions',
            value: '\$24,000',
            subtitle: 'Taxes & benefits',
            color: AppColors.dangerColor,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}