import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class BenefitsList extends StatelessWidget {
  const BenefitsList({super.key});

  @override
  Widget build(BuildContext context) {
    final benefits = [
      'Full Payroll & Geolocation Attendance',
      'Self-Service employee dashboard',
      'Customizable KPI Performance Eval',
      'Applicant Tracking System (HRMS)',
      'Secure group roles & full reporting',
      '24/7 Premium customer assistance',
    ];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INCLUDED BENEFITS:',
            style: AppStyles.bold20PrimaryDark(
              color: Colors.white,
            ).copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
              crossAxisSpacing: 10.w,
            ),
            itemCount: benefits.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: AppColors.accentColor,
                    size: 14.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      benefits[index],
                      style: AppStyles.regular12Grey(
                        color: Colors.white70,
                      ).copyWith(fontSize: 10.sp),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
