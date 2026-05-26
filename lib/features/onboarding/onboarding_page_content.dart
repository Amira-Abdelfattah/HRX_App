import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import 'onboarding_model.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingModel pageModel;

  const OnboardingPageContent({super.key, required this.pageModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 100.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            height: 350.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20.r,
                  offset: Offset(0, 10.h),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Image.asset(
                pageModel.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 48.h),
          Text(
            pageModel.title,
            textAlign: TextAlign.center,
            style: AppStyles.semi24PrimaryDark().copyWith(
              fontSize: 26.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              pageModel.description,
              textAlign: TextAlign.center,
              style: AppStyles.regular14Grey().copyWith(
                fontSize: 16.sp,
                color: AppColors.textBodyColor,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
