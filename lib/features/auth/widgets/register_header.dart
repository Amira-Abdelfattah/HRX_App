import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HRX',
          style: AppStyles.bold28Primary().copyWith(
            color: AppColors.accentColor,
            fontSize: 22.sp,
          ),
        ),
        SizedBox(height: 40.h),
        Center(
          child: Column(
            children: [
              Text(
                'Sign up to HR Saas',
                style: AppStyles.semi24White.copyWith(
                  fontSize: 28.sp,
                  color: AppColors.accentColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Enter details to create your account',
                style: AppStyles.regular14Grey().copyWith(
                  color: AppColors.accentColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
