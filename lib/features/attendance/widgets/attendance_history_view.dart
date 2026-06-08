import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class AttendanceHistoryView extends StatelessWidget {
  const AttendanceHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: isDark ? AppColors.darkBorderColor : AppColors.borderColor),
          boxShadow: isDark ? [] : AppColors.shadowSm,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.calendar_today_outlined, size: 32.sp, color: AppColors.primaryColor),
            ),
            SizedBox(height: 16.h),
            Text(
              'Attendance History',
              style: AppStyles.semi18PrimaryDark(color: isDark ? Colors.white : AppColors.primaryColor),
            ),
            SizedBox(height: 8.h),
            Text(
              'View past attendance records and trends',
              textAlign: TextAlign.center,
              style: AppStyles.regular14Grey(),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                elevation: 0,
              ),
              child: Text('View Full History', style: AppStyles.semi14White),
            ),
          ],
        ),
      ),
    );
  }
}
