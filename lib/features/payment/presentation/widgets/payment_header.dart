import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PaymentHeader extends StatelessWidget {
  const PaymentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.accentColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            'STEP 2 OF 2: BILLING',
            style: AppStyles.bold20PrimaryDark(
              color: AppColors.accentColor,
            ).copyWith(fontSize: 10.sp, letterSpacing: 1.2),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Complete Subscription',
          style: AppStyles.semi24White.copyWith(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Welcome, amira! Select your billing preference and enter card information to launch your SaaS platform workspace.',
          textAlign: TextAlign.center,
          style: AppStyles.regular14Grey(color: Colors.white70),
        ),
      ],
    );
  }
}
