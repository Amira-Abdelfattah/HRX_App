import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class EmployeeCard extends StatelessWidget {
  final String name;
  final String role;
  final String department;
  final int performance;
  final String status;
  final Color statusColor;
  final String initials;
  final VoidCallback? onTap;

  const EmployeeCard({
    super.key,
    required this.name,
    required this.role,
    required this.department,
    required this.performance,
    required this.status,
    required this.statusColor,
    required this.initials,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.borderLightColor,
            width: 1,
          ),
          boxShadow: isDark
              ? []
              : [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            statusColor.withOpacity(0.2),
                            statusColor.withOpacity(0.05),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          initials,
                          style: AppStyles.semi16PrimaryMenu(
                              color: statusColor),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2,
                      bottom: 2,
                      child: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: BoxDecoration(
                          color: AppColors.successColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDark
                                ? AppColors.darkSurfaceColor
                                : AppColors.whiteColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    status.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w900,
                      color: statusColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bold20PrimaryDark(
                color: isDark ? Colors.white : AppColors.primaryColor,
              ).copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: 2.h),
            Text(
              role,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.medium12Grey().copyWith(
                color: isDark ? AppColors.darkTextMuted : AppColors
                    .textMutedColor,
              ),
            ),
            Text(
              department,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.regular12Grey().copyWith(fontSize: 11.sp),
            ),
            const Spacer(),
            Divider(
              color: isDark ? AppColors.darkBorderColor : AppColors
                  .borderLightColor,
              height: 24.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PERFORMANCE',
                      style: AppStyles.regular10Grey().copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                      ),
                    ),
                    Text(
                      '$performance%',
                      style: AppStyles.semi14PrimaryDark(
                        color: isDark ? Colors.white : AppColors.primaryColor,
                      ).copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: LinearProgressIndicator(
                    value: performance / 100,
                    backgroundColor: isDark
                        ? AppColors.darkBorderColor
                        : AppColors.backgroundColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      performance > 80
                          ? AppColors.successColor
                          : performance > 50
                          ? AppColors.warningColor
                          : AppColors.dangerColor,
                    ),
                    minHeight: 6.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
