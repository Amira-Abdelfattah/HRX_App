import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/core/utils/app_validator.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../widgets/custom_txt_field.dart';
import '../manager/login_view_model.dart';
import 'field_label.dart';

class LoginForm extends StatelessWidget {
  final LoginViewModel vm;

  const LoginForm({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: vm.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(label: 'email_address'.tr()),
          CustomTextField(
            controller: vm.emailController,
            validator: AppValidator.validateEmail,
            hintText: 'email_hint_login'.tr(),
            filledColor: Colors.white.withValues(alpha: 0.1),
            borderColor: Colors.transparent,
            style: AppStyles.medium14Category(context: context).copyWith(
              color: AppColors.accentColor,
            ),
            hintStyle: AppStyles.regular14Grey(context: context).copyWith(
              color: AppColors.accentColor.withValues(alpha: 0.4),
            ),
          ),
          SizedBox(height: 20.h),
          FieldLabel(label: 'password'.tr()),
          CustomTextField(
            controller: vm.passwordController,
            validator: AppValidator.validatePassword,
            hintText: '******',
            obSecureText: !vm.isPasswordVisible,
            filledColor: Colors.white.withValues(alpha: 0.1),
            borderColor: Colors.transparent,
            suffixIcon: IconButton(
              icon: Icon(
                vm.isPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.accentColor,
                size: 20,
              ),
              onPressed: vm.togglePasswordVisibility,
            ),
            style: AppStyles.medium14Category(context: context).copyWith(
              color: AppColors.accentColor,
            ),
            hintStyle: AppStyles.regular14Grey(context: context).copyWith(
              color: AppColors.accentColor.withValues(alpha: 0.4),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Checkbox(
                      value: vm.rememberMe,
                      activeColor: AppColors.accentColor,
                      checkColor: AppColors.primaryColor,
                      side: const BorderSide(color: Colors.white70, width: 1.5),
                      onChanged: (value) {
                        if (value != null) {
                          vm.toggleRememberMe(value);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'remember_me'.tr(),
                    style: AppStyles.regular14Grey(context: context).copyWith(
                      color: Colors.white70,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'forgot_password'.tr(),
                  style: AppStyles.semi14PrimaryDark(context: context).copyWith(
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
