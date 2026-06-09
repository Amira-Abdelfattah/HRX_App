import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/dialog_utils.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_txt_field.dart';
import '../presentation/manager/add_employee_states.dart';
import '../presentation/manager/add_employee_view_model.dart';

class AddEmployeeDialog extends StatelessWidget {
  const AddEmployeeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<AddEmployeeViewModel>(context);

    return BlocConsumer<AddEmployeeViewModel, AddEmployeeStates>(
      listener: (context, state) {
        if (state is AddEmployeeLoadingState) {
          DialogUtils.showLoading(
            context: context,
            message: 'Saving employee...',
          );
        } else if (state is AddEmployeeErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            title: 'Error',
          );
        } else if (state is AddEmployeeSuccessState) {
          DialogUtils.hideLoading(context);
          Navigator.pop(context, state.employee);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Employee added successfully!'),
              backgroundColor: AppColors.successColor,
            ),
          );
        }
      },
      builder: (context, state) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 24.h,
            ),
            child: Container(
              width: 500.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 20.h,
                        ),
                        color: AppColors.primaryColor,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add Employee',
                                  style: AppStyles.semi24White,
                                ),
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Create a new employee profile and link them to a job position.',
                                style: AppStyles.regular12Grey(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Form Fields
                      Padding(
                        padding: EdgeInsets.all(24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('EMPLOYEE NAME'),
                            CustomTextField(
                              controller: viewModel.nameController,
                              hintText: 'Amir',
                              prefixIcon: Icon(
                                Icons.person_outline,
                                size: 20.sp,
                                color: AppColors.primaryColor,
                              ),
                              validator: (value) =>
                                  value!.isEmpty ? 'Name is required' : null,
                            ),
                            _buildLabel('EMAIL ADDRESS'),
                            CustomTextField(
                              controller: viewModel.emailController,
                              hintText: 'amir@gmail.com',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                size: 20.sp,
                                color: AppColors.primaryColor,
                              ),
                              validator: (value) =>
                                  value!.isEmpty ? 'Email is required' : null,
                            ),
                            _buildLabel('PASSWORD'),
                            CustomTextField(
                              controller: viewModel.passwordController,
                              hintText: '123',
                              obSecureText: true,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                size: 20.sp,
                                color: AppColors.primaryColor,
                              ),
                              validator: (value) => value!.isEmpty
                                  ? 'Password is required'
                                  : null,
                            ),
                            _buildLabel('JOB POSITION'),
                            CustomTextField(
                              controller: viewModel.jobPositionController,
                              hintText: 'Mobile Application',
                              prefixIcon: Icon(
                                Icons.work_outline,
                                size: 20.sp,
                                color: AppColors.primaryColor,
                              ),
                              validator: (value) => value!.isEmpty
                                  ? 'Job position is required'
                                  : null,
                            ),
                            _buildLabel('SYSTEM ROLE'),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                _buildRoleItem(
                                  viewModel,
                                  'HR Manager',
                                  'hr_manager',
                                  Icons.location_on_outlined,
                                  Colors.blue,
                                ),
                                SizedBox(width: 12.w),
                                _buildRoleItem(
                                  viewModel,
                                  'Manager',
                                  'manager',
                                  Icons.business_center_outlined,
                                  Colors.brown,
                                ),
                                SizedBox(width: 12.w),
                                _buildRoleItem(
                                  viewModel,
                                  'Employee',
                                  'employee',
                                  Icons.person_outline,
                                  Colors.deepPurple,
                                ),
                              ],
                            ),
                            SizedBox(height: 32.h),
                            // Buttons
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'CANCEL',
                                      style: AppStyles.semi14PrimaryDark(
                                        color: AppColors.textMutedColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: 'SAVE EMPLOYEE',
                                    onButtonClicked: () {
                                      viewModel.addEmployee();
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
          ),
        );
      },
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Text(
        label,
        style: AppStyles.medium12Grey().copyWith(
          letterSpacing: 1.1,
          fontSize: 10.sp,
          color: AppColors.textMutedColor.withOpacity(0.7),
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
    return Expanded(
      child: GestureDetector(
        onTap: () => viewModel.changeRole(roleValue),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryColor.withOpacity(0.05)
                : Colors.transparent,
            border: Border.all(
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.borderColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.primaryColor : color,
                size: 24.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                label,
                style: AppStyles.medium12Grey().copyWith(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.textMutedColor,
                  fontSize: 10.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
