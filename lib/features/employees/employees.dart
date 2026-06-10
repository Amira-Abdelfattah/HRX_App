import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/di/service_locator.dart';
import '../../core/utils/app_colors.dart';
import '../performix_engin/presentation/screens/employee_details_screen.dart';
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
  final List<AddEmployeeResponseEntity> dummyEmployees = [
    AddEmployeeResponseEntity(
      name: 'Amira Ahmed',
      role: 'Senior Flutter Developer',
      email: 'amira@example.com',
      jobId: [1, 'Mobile Development'],
    ),
    AddEmployeeResponseEntity(
      name: 'Ahmed Mohamed',
      role: 'UI/UX Designer',
      email: 'ahmed@example.com',
      jobId: [2, 'Design Team'],
    ),
    AddEmployeeResponseEntity(
      name: 'Sara Youssef',
      role: 'Backend Developer',
      email: 'sara@example.com',
      jobId: [3, 'Engineering'],
    ),
    AddEmployeeResponseEntity(
      name: 'Omar Khalid',
      role: 'Project Manager',
      email: 'omar@example.com',
      jobId: [4, 'Management'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddEmployeeViewModel>(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Builder(
          builder: (context) {
            return _buildBody(context, dummyEmployees);
          }
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context,
      List<AddEmployeeResponseEntity> employees) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          CustomPageHeader(
            title: 'Employees',
            subtitle: 'Manage your team members',
            actionLabel: 'Add Employee',
            onActionPressed: () async {
              final newEmployee = await showDialog<AddEmployeeResponseEntity>(
                context: context,
                barrierColor: Colors.black.withValues(alpha: 0.2),
                builder: (dialogContext) =>
                    BlocProvider.value(
                      value: BlocProvider.of<AddEmployeeViewModel>(context),
                      child: const AddEmployeeDialog(),
                    ),
              );

              if (newEmployee != null) {
                setState(() {
                  dummyEmployees.insert(0, newEmployee);
                });
              }
            },
          ),
          SizedBox(height: 24.h),
          _buildSummarySection(employees.length),
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
            itemCount: employees.length,
            itemBuilder: (context, index) {
              final emp = employees[index];

              String displayJob = 'General';
              if (emp.jobId is List && (emp.jobId as List).length > 1) {
                displayJob = (emp.jobId as List)[1].toString();
              } else if (emp.jobId is String) {
                displayJob = emp.jobId as String;
              }

              String name = emp.name ?? 'Unknown';

              String initials = 'U';
              List<String> nameParts = name.trim().split(' ');
              if (nameParts.length > 1) {
                initials = (nameParts[0].isNotEmpty ? nameParts[0][0] : '') +
                    (nameParts[1].isNotEmpty ? nameParts[1][0] : '');
                initials = initials.toUpperCase();
              } else if (nameParts.isNotEmpty && nameParts[0].isNotEmpty) {
                initials = nameParts[0][0].toUpperCase();
              }

              return EmployeeCard(
                name: name,
                role: emp.role ?? 'Employee',
                department: displayJob,
                performance: 100,
                status: 'Active',
                statusColor: AppColors.successColor,
                initials: initials,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EmployeeDetailsScreen(
                            employee: {
                              'name': name,
                              'role': emp.role,
                              'dept': displayJob,
                              'email': emp.email ?? 'No Email',
                              'init': initials,
                              'perf': 100,
                            },
                          ),
                    ),
                  );
                },
              );
            },
          ),
        ],
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
      ],
    );
  }
}
