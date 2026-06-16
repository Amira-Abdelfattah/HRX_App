import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'leave_request_card.dart';

class LeaveRequestsView extends StatelessWidget {
  const LeaveRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, dynamic>> leaveRequests = [
      {
        'name': 'Sarah Johnson',
        'type': 'vacation'.tr(),
        'fromDate': 'Apr 20, 2023',
        'toDate': 'Apr 22, 2023',
        'reason': 'family_vacation'.tr(),
        'status': 'pending'.tr(),
        'statusColor': AppColors.warningColor,
      },
      {
        'name': 'Michael Chen',
        'type': 'sick_leave'.tr(),
        'fromDate': 'Apr 15, 2023',
        'toDate': 'Apr 15, 2023',
        'reason': 'medical_appointment'.tr(),
        'status': 'approved'.tr(),
        'statusColor': AppColors.successColor,
      },
      {
        'name': 'Emma Williams',
        'type': 'personal'.tr(),
        'fromDate': 'Apr 25, 2023',
        'toDate': 'Apr 28, 2023',
        'reason': 'personal_matter'.tr(),
        'status': 'pending'.tr(),
        'statusColor': AppColors.warningColor,
      },
      {
        'name': 'James Brown',
        'type': 'vacation'.tr(),
        'fromDate': 'May 1, 2023',
        'toDate': 'May 5, 2023',
        'reason': 'conflict_deadline'.tr(),
        'status': 'rejected'.tr(),
        'statusColor': AppColors.dangerColor,
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 20.h),
      itemCount: leaveRequests.length + 1,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              "leave_requests".tr(),
              style: AppStyles.bold20PrimaryDark(color: isDark ? Colors.white : AppColors.primaryColor),
            ),
          );
        }
        return LeaveRequestCard(request: leaveRequests[index - 1]);
      },
    );
  }
}
