import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class HiringPipelineView extends StatelessWidget {
  const HiringPipelineView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderLightColor,
        ),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hiring Pipeline',
            style: AppStyles.semi18PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPipelineStep(context, '124', 'Applied', Colors.teal),
              _buildPipelineStep(context, '45', 'Screening', Colors.indigo),
              _buildPipelineStep(context, '28', 'Interview', Colors.orange),
              _buildPipelineStep(context, '8', 'Offer', Colors.pink),
              _buildPipelineStep(context, '5', 'Hired', Colors.green),
            ],
          ),
          SizedBox(height: 32.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurfaceLightColor
                  : AppColors.surfaceLightColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pipeline Insights',
                  style: AppStyles.medium14PrimaryDark(
                    color: isDark ? Colors.white : AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Your hiring funnel shows a 58% conversion rate from screening to interview stage.',
                  style: AppStyles.regular12Grey(),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.trending_up,
                      size: 14.sp,
                      color: AppColors.successColor,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '12% improvement from last quarter',
                      style: AppStyles.medium12Green(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPipelineStep(
    BuildContext context,
    String count,
    String label,
    Color color,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          width: 50.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          count,
          style: AppStyles.bold20PrimaryDark(
            color: isDark ? Colors.white : AppColors.primaryColor,
          ),
        ),

        Text(label, style: AppStyles.regular10Grey()),
      ],
    );
  }
}
