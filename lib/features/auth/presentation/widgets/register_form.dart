import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../widgets/custom_txt_field.dart';
import '../manager/register_states.dart';
import '../manager/register_view_model.dart';
import 'field_label.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = RegisterViewModel.get(context);
    return Form(
      key: viewModel.formKey,
      child: BlocBuilder<RegisterViewModel, RegisterStates>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FieldLabel(label: 'Your name'),
              CustomTextField(
                controller: viewModel.nameController,
                validator: AppValidator.validateFullName,
                hintText: 'Hussain Ahmed',
                filledColor: const Color(0xff1E3A73),
                borderColor: Colors.transparent,
                style: AppStyles.medium14Category().copyWith(
                  color: Colors.white,
                ),
                hintStyle: AppStyles.regular14Grey().copyWith(
                  color: Colors.white.withOpacity(0.3),
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
                          filledColor: const Color(0xff1E3A73),
                          borderColor: Colors.transparent,
                          style: AppStyles.medium14Category().copyWith(
                            color: Colors.white,
                          ),
                          hintStyle: AppStyles.regular14Grey().copyWith(
                            color: Colors.white.withOpacity(0.3),
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
                        DropdownButtonFormField<String>(
                          value: viewModel.selectedRole,
                          dropdownColor: const Color(0xff1E3A73),
                          style: AppStyles.medium14Category().copyWith(
                            color: Colors.white,
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white54,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xff1E3A73),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: const BorderSide(
                                color: AppColors.accentColor,
                                width: 2,
                              ),
                            ),
                          ),
                          items: ['HR Manager', 'Manager', 'Employee']
                              .map((role) =>
                              DropdownMenuItem(
                                value: role,
                                child: Text(role),
                              ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              viewModel.changeRole(value);
                            }
                          },
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const FieldLabel(label: 'Your E-mail or Phone Number'),
              CustomTextField(
                controller: viewModel.emailController,
                validator: AppValidator.validateEmail,
                hintText: 'yourmale0123@gmail.com',
                filledColor: const Color(0xff1E3A73),
                borderColor: Colors.transparent,
                style: AppStyles.medium14Category().copyWith(
                  color: Colors.white,
                ),
                hintStyle: AppStyles.regular14Grey().copyWith(
                  color: Colors.white.withOpacity(0.3),
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
                          obSecureText: !viewModel.isPasswordVisible,
                          filledColor: const Color(0xff1E3A73),
                          borderColor: Colors.transparent,
                          suffixIcon: IconButton(
                            onPressed: viewModel.togglePasswordVisibility,
                            icon: Icon(
                              viewModel.isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.white54,
                              size: 20,
                            ),
                          ),
                          style: AppStyles.medium14Category().copyWith(
                            color: Colors.white,
                          ),
                          hintStyle: AppStyles.regular14Grey().copyWith(
                            color: Colors.white.withOpacity(0.3),
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
                          validator: (val) =>
                              AppValidator.validateConfirmPassword(
                                val,
                                viewModel.passwordController.text,
                              ),
                          hintText: '*********',
                          obSecureText: !viewModel.isConfirmPasswordVisible,
                          filledColor: const Color(0xff1E3A73),
                          borderColor: Colors.transparent,
                          suffixIcon: IconButton(
                            onPressed: viewModel
                                .toggleConfirmPasswordVisibility,
                            icon: Icon(
                              viewModel.isConfirmPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.white54,
                              size: 20,
                            ),
                          ),
                          style: AppStyles.medium14Category().copyWith(
                            color: Colors.white,
                          ),
                          hintStyle: AppStyles.regular14Grey().copyWith(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
