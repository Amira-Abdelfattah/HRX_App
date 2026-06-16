import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/quick_action_button.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.primaryDarkColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.bolt, color: AppColors.accentColor, size: 24.sp),
              SizedBox(width: 8.w),
              Text(
                'quick_actions'.tr(),
                style: AppStyles.semi20Primary(
                    context: context, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'quick_actions_desc'.tr(),
            style: AppStyles.regular14Grey(
                context: context, color: Colors.white70),
          ),
          SizedBox(height: 20.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              QuickActionButton(
                icon: Icons.person_add_alt_1,
                label: 'add_employee'.tr(),
                backgroundColor: AppColors.accentColor,
                onPressed: () {},
              ),
              QuickActionButton(
                icon: Icons.trending_up_rounded,
                label: 'view_analytics'.tr(),
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                onPressed: () {},
              ),
              QuickActionButton(
                icon: Icons.check_circle_outline,
                label: 'approve_leave_count'.tr(args: ['5']),
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
