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
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark ? AppColors.darkBorderColor : AppColors
              .borderLightColor,
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
                    radius: 22.r,
                    backgroundColor: statusColor.withOpacity(0.1),
                    child: Text(
                      initials,
                      style: AppStyles.semi16PrimaryMenu(color: statusColor),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        color: AppColors.successColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark ? AppColors.darkSurfaceColor : AppColors
                              .whiteColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, color: AppColors.textMutedColor,
                    size: 18.sp),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.bold20PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text(
            role,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.medium12Grey(),
          ),
          SizedBox(height: 2.h),
          Text(
            department,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.regular12Grey(),
          ),
          const Spacer(),
          Divider(color: isDark ? AppColors.darkBorderColor : AppColors
              .borderLightColor),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PERF.', style: AppStyles.regular10Grey()),
                    Row(
                      children: [
                        Icon(Icons.trending_up, size: 12.sp,
                            color: AppColors.textMutedColor),
                        SizedBox(width: 4.w),
                        Text(
                          '$performance',
                          style: AppStyles.semi14PrimaryDark(
                            color: isDark ? Colors.white : AppColors
                                .primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 9.sp,
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
