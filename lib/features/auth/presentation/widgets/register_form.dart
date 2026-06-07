import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../widgets/custom_txt_field.dart';
import '../manager/register_view_model.dart';
import 'field_label.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = RegisterViewModel.get(context);
    return Form(
      key: viewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FieldLabel(label: 'Your name'),
          CustomTextField(
            controller: viewModel.nameController,
            validator: AppValidator.validateFullName,
            hintText: 'Hussain Ahmed',
            filledColor: Colors.white.withValues(alpha: 0.1),
            borderColor: Colors.transparent,
            style: AppStyles.medium14Category().copyWith(
              color: AppColors.accentColor,
            ),
            hintStyle: AppStyles.regular14Grey().copyWith(
              color: AppColors.accentColor.withValues(alpha: 0.4),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Company'),
                    CustomTextField(
                      controller: viewModel.companyController,
                      validator: AppValidator.validateCompanyName,
                      hintText: 'Acme Corp',
                      filledColor: Colors.white.withValues(alpha: 0.1),
                      borderColor: Colors.transparent,
                      style: AppStyles.medium14Category().copyWith(
                        color: AppColors.accentColor,
                      ),
                      hintStyle: AppStyles.regular14Grey().copyWith(
                        color: AppColors.accentColor.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Role'),
                    CustomTextField(
                      controller: viewModel.roleController,
                      validator: AppValidator.validateRole,
                      hintText: 'HR Manager',
                      filledColor: Colors.white.withValues(alpha: 0.1),
                      borderColor: Colors.transparent,
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.accentColor,
                      ),
                      style: AppStyles.medium14Category().copyWith(
                        color: AppColors.accentColor,
                      ),
                      hintStyle: AppStyles.regular14Grey().copyWith(
                        color: AppColors.accentColor.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const FieldLabel(label: 'Your E-mail'),
          CustomTextField(
            controller: viewModel.emailController,
            validator: AppValidator.validateEmail,
            hintText: 'yourmale0123@gmail.com',
            filledColor: Colors.white.withValues(alpha: 0.1),
            borderColor: Colors.transparent,
            style: AppStyles.medium14Category().copyWith(
              color: AppColors.accentColor,
            ),
            hintStyle: AppStyles.regular14Grey().copyWith(
              color: AppColors.accentColor.withValues(alpha: 0.4),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Password'),
                    CustomTextField(
                      controller: viewModel.passwordController,
                      validator: AppValidator.validatePassword,
                      hintText: '*********',
                      obSecureText: true,
                      filledColor: Colors.white.withValues(alpha: 0.1),
                      borderColor: Colors.transparent,
                      suffixIcon: const Icon(
                        Icons.visibility_off_outlined,
                        color: AppColors.accentColor,
                        size: 20,
                      ),
                      style: AppStyles.medium14Category().copyWith(
                        color: AppColors.accentColor,
                      ),
                      hintStyle: AppStyles.regular14Grey().copyWith(
                        color: AppColors.accentColor.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel(label: 'Confirm Password'),
                    CustomTextField(
                      controller: viewModel.confirmPasswordController,
                      validator: (val) => AppValidator.validateConfirmPassword(
                        val,
                        viewModel.passwordController.text,
                      ),
                      hintText: '*********',
                      obSecureText: true,
                      filledColor: Colors.white.withValues(alpha: 0.1),
                      borderColor: Colors.transparent,
                      suffixIcon: const Icon(
                        Icons.visibility_off_outlined,
                        color: AppColors.accentColor,
                        size: 20,
                      ),
                      style: AppStyles.medium14Category().copyWith(
                        color: AppColors.accentColor,
                      ),
                      hintStyle: AppStyles.regular14Grey().copyWith(
                        color: AppColors.accentColor.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
