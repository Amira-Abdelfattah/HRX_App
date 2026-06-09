import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class DrawerUserSection extends StatelessWidget {
  const DrawerUserSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.borderLightColor,
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.accentColor,
            child: const Text('JD', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'John Doe',
                  style: AppStyles.medium14PrimaryDarkName(
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimaryColor,
                  ),
                ),
                Text(
                  'HR Manager',
                  style: AppStyles.regular12PrimaryDarkRole(
                    color: isDark
                        ? AppColors.darkTextMuted
                        : AppColors.textMutedColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
