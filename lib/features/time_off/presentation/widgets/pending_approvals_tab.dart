import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PendingApprovalsTab extends StatelessWidget {
  const PendingApprovalsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isDark ? null : AppColors.shadowSm,
        border: isDark ? Border.all(color: AppColors.darkBorderColor) : null,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 40.sp,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'All Caught Up!',
            style: AppStyles.semi18PrimaryDark(context: context),
          ),
          SizedBox(height: 8.h),
          Text(
            'No pending leave requests require your attention right now.',
            style: AppStyles.regular14Grey(context: context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
