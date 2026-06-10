import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_txt_field.dart';
import '../presentation/manager/add_employee_states.dart';
import '../presentation/manager/add_employee_view_model.dart';

class AddEmployeeDialog extends StatelessWidget {
  const AddEmployeeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<AddEmployeeViewModel>(context);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: BlocConsumer<AddEmployeeViewModel, AddEmployeeStates>(
        listener: (context, state) {
          if (state is AddEmployeeSuccessState) {
            Navigator.pop(context, state.employee);
          }
        },
        builder: (context, state) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.r),
            ),
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 24.h,
            ),
            child: Container(
              width: 480.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 22.h,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E3A8A),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add Employee',
                                  style: AppStyles.semi24White.copyWith(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    padding: EdgeInsets.all(4.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                          alpha: 0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              'Create a new employee profile and link them to a job position.',
                              style: AppStyles.regular12Grey(
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Form Fields
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w,
                            vertical: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('EMPLOYEE NAME'),
                            CustomTextField(
                              controller: viewModel.nameController,
                              hintText: 'jon',
                              filledColor: const Color(0xFFF8FAFC),
                              validator: (value) =>
                              (value == null || value.isEmpty)
                                  ? 'Name is required'
                                  : null,
                              prefixIcon: Icon(
                                  Icons.person_outline, size: 20.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 4.h),
                            _buildLabel('EMAIL ADDRESS'),
                            CustomTextField(
                              controller: viewModel.emailController,
                              hintText: 'jon@gmail.com',
                              filledColor: const Color(0xFFF8FAFC),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Email is required';
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value))
                                  return 'Enter valid email';
                                return null;
                              },
                              prefixIcon: Icon(
                                  Icons.email_outlined, size: 20.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                _buildLabel('COMPANY NAME'),
                                SizedBox(width: 4.w),
                                Text(
                                  'AUTO',
                                  style: AppStyles.medium12Grey().copyWith(
                                    fontSize: 10.sp,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                            CustomTextField(
                              controller: viewModel.companyController,
                              readOnly: true,
                              hintText: 'race',
                              filledColor: const Color(0xFFF1F5F9),
                              prefixIcon: Icon(
                                  Icons.business_outlined, size: 20.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 4.h),
                            _buildLabel('PASSWORD'),
                            CustomTextField(
                              controller: viewModel.passwordController,
                              hintText: '...',
                              obSecureText: true,
                              filledColor: const Color(0xFFEFF6FF),
                              validator: (value) =>
                              (value == null || value.isEmpty)
                                  ? 'Password is required'
                                  : null,
                              prefixIcon: Icon(Icons.lock_outline, size: 20.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 4.h),
                            _buildLabel('JOB POSITION'),
                            CustomTextField(
                              controller: viewModel.jobPositionController,
                              hintText: 'developer',
                              borderColor: const Color(0xFF6366F1),
                              validator: (value) =>
                              (value == null || value.isEmpty)
                                  ? 'Job position is required'
                                  : null,
                              prefixIcon: Icon(Icons.work_outline, size: 20.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 4.h),
                            _buildLabel('SYSTEM ROLE'),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                _buildRoleItem(
                                  viewModel,
                                  'HR Manager',
                                  'hr_manager',
                                  Icons.verified_user_outlined,
                                  const Color(0xFF3B82F6),
                                ),
                                SizedBox(width: 10.w),
                                _buildRoleItem(
                                  viewModel,
                                  'Manager',
                                  'manager',
                                  Icons.business_center_outlined,
                                  const Color(0xFF92400E),
                                ),
                                SizedBox(width: 10.w),
                                _buildRoleItem(
                                  viewModel,
                                  'Employee',
                                  'employee',
                                  Icons.person_outline,
                                  const Color(0xFF6366F1),
                                ),
                              ],
                            ),
                            SizedBox(height: 32.h),

                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'CANCEL',
                                      style: AppStyles.semi14PrimaryDark(
                                        color: Colors.grey.shade600,
                                      ).copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  flex: 3,
                                  child: CustomElevatedButton(
                                    text: 'SAVE EMPLOYEE',
                                    backgroundColor: const Color(0xFF1E3A8A),
                                    textStyle: AppStyles.semi16White.copyWith(
                                      fontSize: 14.sp,
                                      letterSpacing: 0.5,
                                    ),
                                    onButtonClicked: () {
                                      if (viewModel.formKey.currentState!
                                          .validate()) {
                                        viewModel.addEmployee();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h, left: 2.w),
      child: Text(
        label,
        style: AppStyles.medium12Grey().copyWith(
          letterSpacing: 0.8,
          fontSize: 10.sp,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildRoleItem(
    AddEmployeeViewModel viewModel,
    String label,
    String roleValue,
    IconData icon,
    Color color,
  ) {
    bool isSelected = viewModel.selectedRole == roleValue;
    Color activeColor = const Color(0xFF6366F1);

    return Expanded(
      child: GestureDetector(
        onTap: () => viewModel.changeRole(roleValue),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: isSelected
                ? activeColor.withValues(alpha: 0.05)
                : Colors.white,
            border: Border.all(
              color: isSelected
                  ? activeColor
                  : Colors.grey.shade200,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? activeColor : color.withValues(alpha: 0.8),
                size: 24.sp,
              ),
              SizedBox(height: 6.h),
              Text(
                label,
                style: AppStyles.medium12Grey().copyWith(
                  color: isSelected
                      ? activeColor
                      : Colors.grey.shade600,
                  fontSize: 10.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
