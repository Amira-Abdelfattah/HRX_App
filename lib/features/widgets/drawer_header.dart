import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DrawerHeader(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bolt, color: AppColors.accentColor, size: 40.sp),
          Text(
            'Performix HR',
            style: AppStyles.semi20Primary(color: AppColors.whiteColor),
          ),
          Text(
            'Smart HRMS',
            style: AppStyles.regular12Grey(
              color: AppColors.whiteColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
