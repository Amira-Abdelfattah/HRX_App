import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomPageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? actionLabel;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;

  const CustomPageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.actionIcon,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.bold32PrimaryDark(context: context),
              ),
              Text(
                subtitle,
                style: AppStyles.regular12Grey(context: context),
              ),
            ],
          ),
        ),
        if (actionLabel != null)
          ElevatedButton.icon(
            onPressed: onActionPressed,
            icon: Icon(actionIcon ?? Icons.add, color: Colors.white, size: 18.sp),
            label: Text(actionLabel!, style: AppStyles.semi12White),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
      ],
    );
  }
}
