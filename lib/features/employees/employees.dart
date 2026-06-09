import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/di/service_locator.dart';
import '../../core/utils/app_colors.dart';
import '../widgets/custom_page_header.dart';
import '../widgets/summary_card.dart';
import 'domain/entities/add_employee_response_entity.dart';
import 'presentation/manager/add_employee_view_model.dart';
import 'widgets/add_employee_dialog.dart';
import 'widgets/employee_card.dart';
import 'widgets/employees_search_filter.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final List<Map<String, dynamic>> _employees = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddEmployeeViewModel>(),
      child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  CustomPageHeader(
                    title: 'Employees',
                    subtitle: 'Manage your team members',
                    actionLabel: 'Add Employee',
                    onActionPressed: () async {
                      final result = await showDialog<
                          AddEmployeeResponseEntity>(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.3),
                        builder: (dialogContext) =>
                            BlocProvider.value(
                              value: BlocProvider.of<AddEmployeeViewModel>(
                                  context),
                              child: const AddEmployeeDialog(),
                            ),
                      );

                      print('Dialog result: $result');
                      if (result != null) {
                        print('Adding employee: ${result.name}');
                        setState(() {
                          _employees.insert(0, {
                            'name': result.name ?? 'Unknown',
                            'role': result.role ?? 'Employee',
                            'dept': result.jobId ?? 'General',
                            'perf': 100,
                            'status': 'New',
                            'color': AppColors.primaryColor,
                            'init': (result.name != null &&
                                result.name!.isNotEmpty)
                                ? result.name!.substring(0, 1).toUpperCase()
                                : 'U',
                          });
                        });
                      }
                    },
                  ),
                  SizedBox(height: 24.h),
                  _buildSummarySection(_employees.length),
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
                    itemCount: _employees.length,
                    itemBuilder: (context, index) {
                      final emp = _employees[index];
                      return EmployeeCard(
                        name: emp['name'] ?? 'Unknown',
                        role: emp['role'] ?? 'Employee',
                        department: emp['dept'] ?? 'General',
                        performance: emp['perf'] ?? 0,
                        status: emp['status'] ?? 'Active',
                        statusColor: emp['color'] ?? AppColors.primaryColor,
                        initials: emp['init'] ?? 'U',
                      );
                    },
                  ),
                ],
              ),
            );
          }
      ),
    );
  }

  Widget _buildSummarySection(int totalCount) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SummaryCard(
                title: 'Total',
                value: totalCount.toString(),
                subtitle: 'Employees',
                icon: Icons.people_alt_rounded,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: SummaryCard(
                title: 'Active',
                value: totalCount.toString(),
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
                value: '0',
                subtitle: 'Approved',
                icon: Icons.calendar_month_rounded,
                color: AppColors.warningColor,
              ),
            ),
            SizedBox(width: 12.w),
            const Expanded(
              child: SummaryCard(
                title: 'Avg Perf.',
                value: '100%',
                subtitle: 'Team score',
                icon: Icons.speed_rounded,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
