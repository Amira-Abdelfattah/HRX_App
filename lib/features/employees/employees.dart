import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../widgets/custom_page_header.dart';
import '../widgets/summary_card.dart';
import 'widgets/employee_card.dart';
import 'widgets/employees_search_filter.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  final List<Map<String, dynamic>> _employeesData = const [
    {
      'name': 'Sarah Johnson',
      'role': 'Senior Developer',
      'dept': 'Engineering',
      'perf': 92,
      'status': 'Excellent',
      'color': AppColors.successColor,
      'init': 'SJ',
    },
    {
      'name': 'Michael Chen',
      'role': 'Product Manager',
      'dept': 'Product',
      'perf': 88,
      'status': 'Good',
      'color': AppColors.warningColor,
      'init': 'MC',
    },
    {
      'name': 'Emma Williams',
      'role': 'UX Designer',
      'dept': 'Design',
      'perf': 90,
      'status': 'Excellent',
      'color': AppColors.successColor,
      'init': 'EW',
    },
    {
      'name': 'James Brown',
      'role': 'Sales Lead',
      'dept': 'Sales',
      'perf': 85,
      'status': 'Good',
      'color': AppColors.warningColor,
      'init': 'JB',
    },
    {
      'name': 'Olivia Davis',
      'role': 'HR Specialist',
      'dept': 'HR',
      'perf': 91,
      'status': 'Excellent',
      'color': AppColors.successColor,
      'init': 'OD',
    },
    {
      'name': 'Robert Garcia',
      'role': 'DevOps Engineer',
      'dept': 'Engineering',
      'perf': 89,
      'status': 'Good',
      'color': AppColors.warningColor,
      'init': 'RG',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          CustomPageHeader(
            title: 'Employees',
            subtitle: 'Manage your team members',
            actionLabel: 'Add Employee',
            onActionPressed: () {},
          ),
          SizedBox(height: 24.h),

          Row(
            children: [
              const Expanded(
                child: SummaryCard(
                  title: 'Total',
                  value: '6',
                  subtitle: 'Employees',
                  icon: Icons.people_alt_rounded,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(width: 12.w),
              const Expanded(
                child: SummaryCard(
                  title: 'Active',
                  value: '5',
                  subtitle: 'At work',
                  icon: Icons.check_circle_rounded,
                  color: AppColors.successColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              const Expanded(
                child: SummaryCard(
                  title: 'On Leave',
                  value: '1',
                  subtitle: 'Approved',
                  icon: Icons.calendar_month_rounded,
                  color: AppColors.warningColor,
                ),
              ),
              SizedBox(width: 12.w),
              const Expanded(
                child: SummaryCard(
                  title: 'Avg Perf.',
                  value: '89%',
                  subtitle: 'Team score',
                  icon: Icons.speed_rounded,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),
          const EmployeesSearchFilter(),

          SizedBox(height: 24.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 280.h,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: _employeesData.length,
            itemBuilder: (context, index) {
              final emp = _employeesData[index];
              return EmployeeCard(
                name: emp['name'],
                role: emp['role'],
                department: emp['dept'],
                performance: emp['perf'],
                status: emp['status'],
                statusColor: emp['color'],
                initials: emp['init'],
              );
            },
          ),
        ],
      ),
    );
  }
}
