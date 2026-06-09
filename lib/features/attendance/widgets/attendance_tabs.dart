import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class AttendanceTabs extends StatelessWidget {
  final TabController tabController;

  const AttendanceTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.primaryColor,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: isDark ? Colors.grey : AppColors.textMutedColor,
        labelStyle: AppStyles.semi14White,
        unselectedLabelStyle: AppStyles.regular14Grey(),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(text: "Today's Attendance"),
          Tab(text: "History"),
          Tab(text: "Leave Requests"),
        ],
      ),
    );
  }
}
