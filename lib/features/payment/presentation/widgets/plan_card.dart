import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String period;
  final bool isSelected;
  final bool isPopular;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.period,
    required this.isSelected,
    this.isPopular = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.transparent
                  : Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isSelected ? AppColors.accentColor : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.bold20PrimaryDark(
                    context: context,
                    color: Colors.white,
                  ).copyWith(fontSize: 18.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: AppStyles.regular12Grey(
                      context: context, color: Colors.white70),
                ),
                SizedBox(height: 20.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: AppStyles.bold32PrimaryDark(
                          context: context, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.h, left: 4.w),
                      child: Text(
                        period,
                        style: AppStyles.regular12Grey(
                            context: context, color: Colors.white60),
                      ),
                    ),
                  ],
                ),
                if (isSelected)
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check_circle,
                      color: AppColors.accentColor,
                      size: 20.sp,
                    ),
                  ),
              ],
            ),
          ),
          if (isPopular)
            Positioned(
              top: -10.h,
              right: 10.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'POPULAR',
                  style: AppStyles.bold20PrimaryDark(
                    context: context,
                    color: AppColors.primaryColor,
                  ).copyWith(fontSize: 10.sp),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
