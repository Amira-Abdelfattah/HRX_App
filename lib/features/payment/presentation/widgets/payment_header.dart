import 'package:easy_localization/easy_localization.dart';
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
            color: AppColors.accentColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            'step_2_of_2'.tr(),
            style: AppStyles.bold20PrimaryDark(
              context: context,
              color: AppColors.accentColor,
            ).copyWith(fontSize: 10.sp, letterSpacing: 1.2),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'complete_subscription'.tr(),
          style: AppStyles.semi24White(context: context).copyWith(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'payment_welcome'.tr(),
          textAlign: TextAlign.center,
          style: AppStyles.regular14Grey(
              context: context, color: Colors.white70),
        ),
      ],
    );
  }
}

