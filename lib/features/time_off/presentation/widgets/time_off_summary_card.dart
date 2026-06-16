import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/core/utils/app_colors.dart';
import 'package:hrx_app/core/utils/app_styles.dart';

class TimeOffSummaryCard extends StatelessWidget {
  final String title;
  final String total;
  final String used;
  final String left;
  final Color color;
  final IconData icon;

  const TimeOffSummaryCard({
    super.key,
    required this.title,
    required this.total,
    required this.used,
    required this.left,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 140.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.15 : 0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: color.withValues(alpha: isDark ? 0.3 : 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 16.sp),
              ),
              Flexible(
                child: Text(
                  '$left left',
                  style: AppStyles.medium14Grey(
                    context: context,
                    color: color,
                  ).copyWith(fontSize: 10.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: AppStyles.regular12Grey(
              context: context,
            ).copyWith(fontSize: 11.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                used,
                style: AppStyles.bold20PrimaryDark(
                  context: context,
                ).copyWith(fontSize: 18.sp),
              ),
              Text(
                '/$total',
                style: AppStyles.regular14Grey(
                  context: context,
                ).copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value:
                  double.tryParse(used) != null &&
                      double.tryParse(total) != null
                  ? (double.parse(used) / double.parse(total))
                  : 0,
              backgroundColor: isDark
                  ? AppColors.darkSurfaceLightColor
                  : Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 4.h,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '$used used',
            style: AppStyles.regular12Grey(
              context: context,
            ).copyWith(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}

