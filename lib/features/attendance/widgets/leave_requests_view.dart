import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'leave_request_card.dart';

class LeaveRequestsView extends StatelessWidget {
  const LeaveRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, dynamic>> leaveRequests = [
      {
        'name': 'Sarah Johnson',
        'type': 'Vacation',
        'fromDate': 'Apr 20, 2023',
        'toDate': 'Apr 22, 2023',
        'reason': 'Family vacation',
        'status': 'Pending',
        'statusColor': AppColors.warningColor,
      },
      {
        'name': 'Michael Chen',
        'type': 'Sick Leave',
        'fromDate': 'Apr 15, 2023',
        'toDate': 'Apr 15, 2023',
        'reason': 'Medical appointment',
        'status': 'Approved',
        'statusColor': AppColors.successColor,
      },
      {
        'name': 'Emma Williams',
        'type': 'Personal',
        'fromDate': 'Apr 25, 2023',
        'toDate': 'Apr 28, 2023',
        'reason': 'Personal matter',
        'status': 'Pending',
        'statusColor': AppColors.warningColor,
      },
      {
        'name': 'James Brown',
        'type': 'Vacation',
        'fromDate': 'May 1, 2023',
        'toDate': 'May 5, 2023',
        'reason': 'Conflict with project deadline',
        'status': 'Rejected',
        'statusColor': AppColors.dangerColor,
      },
    ];

    return ListView.separated(
      padding: EdgeInsets.only(bottom: 20.h),
      physics: const BouncingScrollPhysics(),
      itemCount: leaveRequests.length + 1,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              "Leave Requests",
              style: AppStyles.bold20PrimaryDark(color: isDark ? Colors.white : AppColors.primaryColor),
            ),
          );
        }
        return LeaveRequestCard(request: leaveRequests[index - 1]);
      },
    );
  }
}
