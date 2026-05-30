// lib/features/dashboard/widgets/quick_actions_section.dart
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
                'Quick Actions',
                style: AppStyles.semi20Primary(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Streamline your HR workflows instantly.',
            style: AppStyles.regular14Grey(color: Colors.white70),
          ),
          SizedBox(height: 20.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              QuickActionButton(
                icon: Icons.person_add_alt_1,
                label: 'Add New Employee',
                backgroundColor: AppColors.accentColor,
                onPressed: () {},
              ),
              QuickActionButton(
                icon: Icons.trending_up_rounded,
                label: 'View Analytics',
                backgroundColor: Colors.white.withOpacity(0.2),
                onPressed: () {},
              ),
              QuickActionButton(
                icon: Icons.check_circle_outline,
                label: 'Approve Leave (5)',
                backgroundColor: Colors.white.withOpacity(0.2),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
