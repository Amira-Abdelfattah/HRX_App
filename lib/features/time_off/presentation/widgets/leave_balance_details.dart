import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/core/utils/app_colors.dart';
import 'package:hrx_app/core/utils/app_styles.dart';

import '../../domain/entities/time_off_type_entity.dart';

class LeaveBalanceDetails extends StatelessWidget {
  final List<TimeOffTypeEntity> types;

  const LeaveBalanceDetails({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isDark ? null : AppColors.shadowSm,
        border: isDark ? Border.all(color: AppColors.darkBorderColor) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                size: 20.sp,
                color: AppStyles.regular12Grey().color,
              ),
              SizedBox(width: 8.w),
              Text(
                'Leave Balance Details',
                style: AppStyles.semi16PrimaryDark(),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: types.length > 4 ? 4 : types.length,
            separatorBuilder: (context, index) => Divider(
              height: 32.h,
              color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
            ),
            itemBuilder: (context, index) {
              final type = types[index];
              // Assuming total for UI is some fixed value or virtualRemainingLeaves is what's left
              // For demonstration, let's treat virtualRemainingLeaves as 'left' and assume a max of 21 or something
              // Or better, just show the current available leaves.
              return _buildBalanceItem(
                context,
                icon: _getIconForType(type.displayName),
                iconColor: _getColorForType(index),
                title: type.displayName,
                used: 0,
                // We need another field for 'used' or 'allocated'
                total: type.virtualRemainingLeaves.toInt(),
                progressColor: _getColorForType(index),
              );
            },
          ),
        ],
      ),
    );
  }

  IconData _getIconForType(String name) {
    if (name.toLowerCase().contains('sick')) return Icons.favorite_border;
    if (name.toLowerCase().contains('annual')) return Icons.park_outlined;
    if (name.toLowerCase().contains('personal')) return Icons.wb_sunny_outlined;
    return Icons.history_edu_outlined;
  }

  Color _getColorForType(int index) {
    const colors = [
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.blue,
    ];
    return colors[index % colors.length];
  }

  Widget _buildBalanceItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required int used,
    required int total,
    required Color progressColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final percentage = (total > 0) ? (used / total * 100).toInt() : 0;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 18.sp),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: AppStyles.semi14PrimaryDark()),
                  Text(
                    '$used',
                    style: AppStyles.semi14PrimaryDark(color: iconColor),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: LinearProgressIndicator(
                        value: total > 0 ? used / total : 0,
                        backgroundColor: isDark
                            ? AppColors.darkBorderColor
                            : AppColors.borderColor.withValues(alpha: 0.3),
                        valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                        minHeight: 6.h,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Flexible(
                    child: Text(
                      '$percentage% used of $total days',
                      style: AppStyles.regular10Grey(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

