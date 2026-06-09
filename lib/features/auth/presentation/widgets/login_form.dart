import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/core/utils/app_validator.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../widgets/custom_txt_field.dart';
import 'field_label.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool rememberMe = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FieldLabel(label: 'Email Address'),
          CustomTextField(
            controller: widget.emailController,
            validator: AppValidator.validateEmail,
            hintText: 'admin@gmail.com',
            filledColor: Colors.white.withOpacity(0.1),
            borderColor: Colors.transparent,
            style: AppStyles.medium14Category().copyWith(
              color: AppColors.accentColor,
            ),
            hintStyle: AppStyles.regular14Grey().copyWith(
              color: AppColors.accentColor.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 20.h),
          const FieldLabel(label: 'Password'),
          CustomTextField(
            controller: widget.passwordController,
            validator: AppValidator.validatePassword,
            hintText: '******',
            obSecureText: !isPasswordVisible,
            filledColor: Colors.white.withOpacity(0.1),
            borderColor: Colors.transparent,
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.accentColor,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            style: AppStyles.medium14Category().copyWith(
              color: AppColors.accentColor,
            ),
            hintStyle: AppStyles.regular14Grey().copyWith(
              color: AppColors.accentColor.withOpacity(0.4),
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
                      value: rememberMe,
                      activeColor: AppColors.accentColor,
                      checkColor: AppColors.primaryColor,
                      side: const BorderSide(color: Colors.white70, width: 1.5),
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Remember me',
                    style: AppStyles.regular14Grey().copyWith(
                      color: Colors.white70,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password?',
                  style: AppStyles.semi14PrimaryDark().copyWith(
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
