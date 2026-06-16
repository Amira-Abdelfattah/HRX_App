import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PerformixEngineTabs extends StatelessWidget {
  final int activeTab;
  final Function(int) onTabChanged;

  const PerformixEngineTabs({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceLightColor : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderLightColor,
        ),
      ),
      child: Row(
        children: [
          _buildTab(context, 0, 'performance_leaderboard'.tr()),
          _buildTab(context, 1, 'insights_alerts'.tr()),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, int index, String label) {
    bool isActive = activeTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
        child: Container(
          margin: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppStyles.medium14Grey(
              context: context,
              color: isActive ? Colors.white : AppColors.textMutedColor,
            ),
          ),
        ),
      ),
    );
  }
}
