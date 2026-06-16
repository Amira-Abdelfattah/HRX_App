import 'package:easy_localization/easy_localization.dart';
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
          boxShadow: isDark ? [] : AppColors.shadowMd,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 52.w,
                      height: 52.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isDark
                              ? [
                            AppColors.accentColor.withValues(alpha: 0.2),
                            AppColors.accentColor.withValues(alpha: 0.05),
                          ]
                              : [
                            AppColors.primaryColor.withValues(alpha: 0.1),
                            AppColors.primaryColor.withValues(alpha: 0.02),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark
                              ? AppColors.accentColor.withValues(alpha: 0.2)
                              : AppColors.primaryColor.withValues(alpha: 0.1),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          initials,
                          style: AppStyles.semi18PrimaryDark(
                            context: context,
                            color: isDark
                                ? AppColors.accentColor
                                : AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2,
                      bottom: 2,
                      child: Container(
                        width: 14.w,
                        height: 14.w,
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
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppColors.radiusSm.r),
                    border: Border.all(
                      color: statusColor.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    status.toUpperCase(),
                    style: AppStyles.bold10Grey(
                      context: context,
                      color: statusColor,
                    ).copyWith(letterSpacing: 0.5),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.semi18PrimaryDark(
                context: context,
                color: isDark ? AppColors.whiteColor : AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              role,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.medium12Grey(context: context).copyWith(
                color: isDark
                    ? AppColors.darkTextBody
                    : AppColors.textMutedColor,
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Icon(
                  Icons.business_center_outlined,
                  size: 12.sp,
                  color: AppColors.textSubtleColor,
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    department,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.regular11Grey(context: context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Divider(
              color: isDark
                  ? AppColors.darkBorderColor
                  : AppColors.borderColor.withValues(alpha: 0.5),
              height: 24.h,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'performance_caps'.tr(),
                  style: AppStyles.bold10Grey(context: context).copyWith(
                      letterSpacing: 0.5),
                ),
                Text(
                  '$performance%',
                  style: AppStyles.semi12PrimaryDark(
                    context: context,
                    color: isDark ? AppColors.accentColor : AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Stack(
              children: [
                Container(
                  height: 6.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkBorderColor
                        : AppColors.surfaceLightColor,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
                Container(
                  height: 6.h,
                  width: (performance / 100) * 150.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _getPerformanceColor(performance),
                        _getPerformanceColor(performance).withValues(
                            alpha: 0.6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(3.r),
                    boxShadow: [
                      BoxShadow(
                        color: _getPerformanceColor(performance).withValues(
                            alpha: 0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getPerformanceColor(int performance) {
    if (performance >= 80) return AppColors.successColor;
    if (performance >= 50) return AppColors.warningColor;
    return AppColors.dangerColor;
  }
}
