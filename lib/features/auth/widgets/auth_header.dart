import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showLogo;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLogo)
          Text(
            'HRX',
            style: AppStyles.bold28Primary().copyWith(
              color: AppColors.accentColor,
              fontSize: 22.sp,
            ),
          ),
        SizedBox(height: showLogo ? 40.h : 20.h),
        Center(
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyles.semi24White.copyWith(
                  fontSize: 32.sp,
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppStyles.regular14Grey().copyWith(
                  color: AppColors.accentColor.withOpacity(0.7),
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
