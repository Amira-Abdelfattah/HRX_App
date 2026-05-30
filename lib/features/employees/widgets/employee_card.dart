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

  const EmployeeCard({
    super.key,
    required this.name,
    required this.role,
    required this.department,
    required this.performance,
    required this.status,
    required this.statusColor,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderLightColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: statusColor.withOpacity(0.1),
                    child: Text(
                      initials,
                      style: AppStyles.semi20Primary(color: statusColor),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
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
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: AppColors.textMutedColor,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            name,
            style: AppStyles.bold20PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text(role, style: AppStyles.medium14Grey()),
          SizedBox(height: 4.h),
          Text(department, style: AppStyles.regular12Grey()),
          const Spacer(),
          Divider(
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.borderLightColor,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PERFORMANCE', style: AppStyles.regular10Grey()),
                  Row(
                    children: [
                      Icon(
                        Icons.trending_up,
                        size: 14.sp,
                        color: AppColors.textMutedColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '$performance',
                        style: AppStyles.semi16PrimaryMenu(
                          color: isDark ? Colors.white : AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
