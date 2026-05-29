import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_txt_field.dart';
import 'field_label.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FieldLabel(label: 'Email Address'),
        CustomTextField(
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
          hintText: '******',
          obSecureText: true,
          filledColor: Colors.white.withOpacity(0.1),
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
    );
  }
}
