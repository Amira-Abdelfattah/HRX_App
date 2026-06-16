import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex < 5 ? currentIndex : 0,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: isDark ? AppColors.darkSurfaceColor : AppColors
            .whiteColor,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: isDark ? AppColors.darkTextMuted : AppColors
            .textMutedColor,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        iconSize: 24.sp,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.grid_view_rounded),
              label: 'dashboard'.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.people_outline), label: 'employees'.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_month_outlined),
              label: 'attendance'.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.timer_outlined), label: 'time_off'.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.monetization_on_outlined),
              label: 'payroll'.tr()),
        ],
      ),
    );
  }
}