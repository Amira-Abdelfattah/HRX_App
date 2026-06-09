import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class RecruitmentTabs extends StatelessWidget {
  final int activeTab;
  final Function(int) onTabChanged;

  const RecruitmentTabs({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final List<String> tabs = [
      "Candidate Ranking",
      "Job Listings",
      "Hiring Pipeline",
    ];

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
        children: List.generate(tabs.length, (index) {
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
                  tabs[index],
                  style: AppStyles.medium14Grey(
                    color: isActive ? Colors.white : AppColors.textMutedColor,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
