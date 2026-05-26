import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_txt_field.dart';
import 'field_label.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FieldLabel(label: 'Your name'),
        CustomTextField(
          hintText: 'Hussain Ahmed',
          filledColor: Colors.white.withOpacity(0.1),
          borderColor: Colors.transparent,
          style: AppStyles.medium14Category().copyWith(
            color: AppColors.accentColor,
          ),
          hintStyle: AppStyles.regular14Grey().copyWith(
            color: AppColors.accentColor.withOpacity(0.4),
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
                    hintText: 'Acme Corp',
                    filledColor: Colors.white.withOpacity(0.1),
                    borderColor: Colors.transparent,
                    style: AppStyles.medium14Category().copyWith(
                      color: AppColors.accentColor,
                    ),
                    hintStyle: AppStyles.regular14Grey().copyWith(
                      color: AppColors.accentColor.withOpacity(0.4),
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
                    hintText: 'HR Manager',
                    filledColor: Colors.white.withOpacity(0.1),
                    borderColor: Colors.transparent,
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.accentColor,
                    ),
                    style: AppStyles.medium14Category().copyWith(
                      color: AppColors.accentColor,
                    ),
                    hintStyle: AppStyles.regular14Grey().copyWith(
                      color: AppColors.accentColor.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        const FieldLabel(label: 'Your E-mail or Phone Number'),
        CustomTextField(
          hintText: 'yourmale0123@gmail.com',
          filledColor: Colors.white.withOpacity(0.1),
          borderColor: Colors.transparent,
          style: AppStyles.medium14Category().copyWith(
            color: AppColors.accentColor,
          ),
          hintStyle: AppStyles.regular14Grey().copyWith(
            color: AppColors.accentColor.withOpacity(0.4),
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
                    hintText: '*********',
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
                    hintText: '*********',
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
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
