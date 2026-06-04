import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widgets/status_badge.dart';

class PerformerItem extends StatelessWidget {
  final int rank;
  final String name;
  final String role;
  final String dept;
  final String score;
  final String trend;
  final Color rankColor;

  const PerformerItem({
    super.key,
    required this.rank,
    required this.name,
    required this.role,
    required this.dept,
    required this.score,
    required this.trend,
    required this.rankColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderLightColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(color: rankColor, shape: BoxShape.circle),
            child: Center(child: Text('$rank', style: AppStyles.semi16White)),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: AppStyles.bold20PrimaryDark(
                          color: isDark ? Colors.white : AppColors.primaryColor,
                        ).copyWith(fontSize: 15.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    const StatusBadge(
                      text: 'Excellent',
                      color: AppColors.successColor,
                      icon: Icons.star_rounded,
                    ),
                  ],
                ),
                Text('$role • $dept', style: AppStyles.regular12Grey()),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    score,
                    style: AppStyles.bold20PrimaryDark(
                      color: isDark ? Colors.white : AppColors.primaryColor,
                    ).copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.trending_up,
                    size: 14.sp,
                    color: AppColors.successColor,
                  ),
                  Text(
                    trend,
                    style: AppStyles.medium12Green().copyWith(fontSize: 10.sp),
                  ),
                ],
              ),
              Text(
                'Performance Score',
                style: AppStyles.regular12Grey().copyWith(fontSize: 9.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
