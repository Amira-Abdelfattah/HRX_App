import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

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
        labelStyle: AppStyles.semi14White(context: context),
        unselectedLabelStyle: AppStyles.regular14Grey(context: context),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: [
          Tab(text: "todays_attendance".tr()),
          Tab(text: "history".tr()),
          Tab(text: "leave_requests".tr()),
        ],
      ),
    );
  }
}
