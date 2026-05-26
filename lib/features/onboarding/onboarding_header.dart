import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class OnboardingHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onSkip;

  const OnboardingHeader({
    super.key,
    required this.onBack,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.primaryColor,
              size: 24.r,
            ),
            onPressed: onBack,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'HR',
                style: AppStyles.bold28Primary().copyWith(
                  fontSize: 22.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                'X',
                style: AppStyles.bold28Primary().copyWith(
                  fontSize: 22.sp,
                  color: AppColors.accentColor,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: onSkip,
            child: Text(
              'Skip',
              style: AppStyles.medium14Grey().copyWith(
                color: AppColors.textMutedColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
