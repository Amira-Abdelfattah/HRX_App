import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
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
          } else if (state is AddEmployeeErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message), backgroundColor: Colors.red),
            );
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
                                  'add_employee'.tr(),
                                  style: AppStyles
                                      .semi24White(context: context)
                                      .copyWith(
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
                              'add_employee_desc'.tr(),
                              style: AppStyles.regular12Grey(
                                context: context,
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
                            _buildLabel(context, 'employee_name_caps'.tr()),
                            CustomTextField(
                              controller: viewModel.nameController,
                              hintText: 'jon_hint'.tr(),
                              style: AppStyles
                                  .semi20Primary(context: context)
                                  .copyWith(
                                  fontSize: 16.sp),
                              filledColor: const Color(0xFFF8FAFC),
                              validator: (value) =>
                              (value == null || value.isEmpty)
                                  ? 'name_required'.tr()
                                  : null,
                              prefixIcon: Icon(
                                  Icons.person_outline, size: 20.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 4.h),
                            _buildLabel(context, 'email_address_caps'.tr()),
                            CustomTextField(
                              controller: viewModel.emailController,
                              hintText: 'email_hint'.tr(),
                              style: AppStyles
                                  .semi20Primary(context: context)
                                  .copyWith(
                                  fontSize: 16.sp),
                              filledColor: const Color(0xFFF8FAFC),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'email_required'.tr();
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value))
                                  return 'valid_email_required'.tr();
                                return null;
                              },
                              prefixIcon: Icon(
                                  Icons.email_outlined, size: 20.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                _buildLabel(context, 'company_name_caps'.tr()),
                                SizedBox(width: 4.w),
                                Text(
                                  'auto_caps'.tr(),
                                  style: AppStyles.medium12Grey(
                                      context: context).copyWith(
                                    fontSize: 10.sp,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                            CustomTextField(
                              controller: viewModel.companyController,
                              readOnly: true,
                              hintText: 'company'.tr(),
                              style: AppStyles
                                  .semi20Primary(context: context)
                                  .copyWith(
                                fontSize: 16.sp,
                                color: const Color(0xFF1E3A8A),
                              ),
                              filledColor: const Color(0xFFF1F5F9),
                              prefixIcon: Icon(
                                  Icons.business_outlined, size: 20.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 4.h),
                            _buildLabel(context, 'password_caps'.tr()),
                            CustomTextField(
                              controller: viewModel.passwordController,
                              hintText: '...',
                              obSecureText: true,
                              style: AppStyles
                                  .semi20Primary(context: context)
                                  .copyWith(
                                  fontSize: 16.sp),
                              filledColor: const Color(0xFFEFF6FF),
                              validator: (value) =>
                              (value == null || value.isEmpty)
                                  ? 'password_required'.tr()
                                  : null,
                              prefixIcon: Icon(Icons.lock_outline, size: 20.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 4.h),
                            _buildLabel(context, 'job_position_caps'.tr()),
                            CustomTextField(
                              controller: viewModel.jobPositionController,
                              hintText: 'job_hint'.tr(),
                              style: AppStyles
                                  .semi20Primary(context: context)
                                  .copyWith(
                                  fontSize: 16.sp),
                              borderColor: const Color(0xFF6366F1),
                              validator: (value) =>
                              (value == null || value.isEmpty)
                                  ? 'job_required'.tr()
                                  : null,
                              prefixIcon: Icon(Icons.work_outline, size: 20.sp,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 4.h),
                            _buildLabel(context, 'system_role_caps'.tr()),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                _buildRoleItem(
                                  context,
                                  viewModel,
                                  'hr_manager'.tr(),
                                  'hr_manager',
                                  Icons.verified_user_outlined,
                                  const Color(0xFF3B82F6),
                                ),
                                SizedBox(width: 10.w),
                                _buildRoleItem(
                                  context,
                                  viewModel,
                                  'manager'.tr(),
                                  'manager',
                                  Icons.business_center_outlined,
                                  const Color(0xFF92400E),
                                ),
                                SizedBox(width: 10.w),
                                _buildRoleItem(
                                  context,
                                  viewModel,
                                  'employee'.tr(),
                                  'user',
                                  Icons.person_outline,
                                  const Color(0xFF6366F1),
                                ),
                              ],
                            ),

                            if (state is AddEmployeeErrorState) ...[
                              SizedBox(height: 16.h),
                              Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                      color: Colors.red.shade200),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.error_outline, color: Colors.red,
                                        size: 16.sp),
                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: Text(
                                        state.message,
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],

                            SizedBox(height: 32.h),

                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'cancel_caps'.tr(),
                                      style: AppStyles.semi14PrimaryDark(
                                        context: context,
                                        color: Colors.grey.shade600,
                                      ).copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  flex: 3,
                                  child: CustomElevatedButton(
                                    text: state is AddEmployeeLoadingState
                                        ? 'saving_caps'.tr()
                                        : 'save_employee_caps'.tr(),
                                    backgroundColor: const Color(0xFF1E3A8A),
                                    textStyle: AppStyles.semi16White(
                                        context: context).copyWith(
                                      fontSize: 14.sp,
                                      letterSpacing: 0.5,
                                    ),
                                    onButtonClicked: state is AddEmployeeLoadingState
                                        ? () {}
                                        : () {
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

  Widget _buildLabel(BuildContext context, String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h, left: 2.w),
      child: Text(
        label,
        style: AppStyles.medium12Grey(context: context).copyWith(
          letterSpacing: 0.8,
          fontSize: 10.sp,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildRoleItem(BuildContext context,
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
                style: AppStyles.medium12Grey(context: context).copyWith(
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
