import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/features/employees/presentation/manager/employees_states.dart';
import 'package:hrx_app/features/employees/presentation/manager/employees_view_model.dart';

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
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
        getIt<EmployeesViewModel>()
          ..getEmployees()),
        BlocProvider(create: (context) => getIt<AddEmployeeViewModel>()),
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<EmployeesViewModel, EmployeesStates>(
          builder: (context, state) {
            if (state is EmployeesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EmployeesErrorState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is EmployeesSuccessState) {
              return _buildBody(context, state.employees);
            }
            return const SizedBox.shrink();
          },
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
              final addViewModel = BlocProvider.of<AddEmployeeViewModel>(
                  context);
              final employeesViewModel = BlocProvider.of<EmployeesViewModel>(
                  context);
              addViewModel.resetState();

              final result = await showDialog(
                context: context,
                barrierColor: Colors.black.withOpacity(0.5),
                builder: (dialogContext) =>
                    BlocProvider.value(
                      value: addViewModel,
                      child: const AddEmployeeDialog(),
                    ),
              );

              // Refresh list after dialog closes if addition was successful
              if (result != null) {
                employeesViewModel.getEmployees();
              }
            },
          ),
          SizedBox(height: 24.h),
          _buildSummarySection(employees.length),
          SizedBox(height: 24.h),
          const EmployeesSearchFilter(),
          SizedBox(height: 24.h),
          employees.isEmpty
              ? Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: const Text("No employees found"),
          )
              : GridView.builder(
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
              } else if (emp.jobId != null && emp.jobId != false) {
                displayJob = emp.jobId.toString();
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
