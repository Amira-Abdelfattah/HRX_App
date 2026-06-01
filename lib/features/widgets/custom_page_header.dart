import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomPageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? buttonLabel;
  final IconData? buttonIcon;
  final VoidCallback? onButtonPressed;

  const CustomPageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.buttonLabel,
    this.buttonIcon,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.bold32PrimaryDark(
                  color: isDark ? Colors.white : AppColors.primaryColor,
                ),
              ),
              Text(
                subtitle,
                style: AppStyles.regular12Grey(),
              ),
            ],
          ),
        ),
        if (buttonLabel != null)
          ElevatedButton.icon(
            onPressed: onButtonPressed,
            icon: Icon(buttonIcon ?? Icons.add, color: Colors.white, size: 18.sp),
            label: Text(buttonLabel!, style: AppStyles.semi12White),
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
