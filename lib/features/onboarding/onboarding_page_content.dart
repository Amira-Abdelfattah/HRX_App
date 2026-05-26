import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'onboarding_model.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingModel pageModel;

  const OnboardingPageContent({super.key, required this.pageModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 20.r,
                offset: Offset(0, 10.h),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Image.asset(
              pageModel.imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 40.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: pageModel.title,
                style: AppStyles.semi24PrimaryDark().copyWith(
                  fontSize: 30.sp,
                  height: 1.3,
                ),
              ),
              TextSpan(
                text: pageModel.highlightWord,
                style: AppStyles.semi24PrimaryDark().copyWith(
                  fontSize: 30.sp,
                  color: AppColors.accentDarkColor,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          pageModel.description,
          textAlign: TextAlign.center,
          style: AppStyles.regular14Grey().copyWith(
            fontSize: 14.sp,
            color: AppColors.textBodyColor.withOpacity(0.85),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
