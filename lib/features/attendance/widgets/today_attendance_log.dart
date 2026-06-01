import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'attendance_log_table.dart';

class TodayAttendanceLog extends StatelessWidget {
  const TodayAttendanceLog({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, dynamic>> todayData = [
      {
        'name': 'Sarah Johnson',
        'in': '08:55 AM',
        'out': '05:30 PM',
        'hours': '9h 15m',
        'status': 'Present',
        'color': AppColors.successColor,
      },
      {
        'name': 'Michael Chen',
        'in': '09:00 AM',
        'out': '06:00 PM',
        'hours': '9h 0m',
        'status': 'Present',
        'color': AppColors.successColor,
      },
      {
        'name': 'Emma Williams',
        'in': '09:15 AM',
        'out': '05:30 PM',
        'hours': '8h 15m',
        'status': 'Late',
        'color': AppColors.warningColor,
      },
      {
        'name': 'James Brown',
        'in': '-',
        'out': '-',
        'hours': '-',
        'status': 'Absent',
        'color': AppColors.dangerColor,
      },
      {
        'name': 'Olivia Davis',
        'in': '08:45 AM',
        'out': '06:00 PM',
        'hours': '9h 15m',
        'status': 'Present',
        'color': AppColors.successColor,
      },
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today's Attendance Log",
              style: AppStyles.bold20PrimaryDark(color: isDark ? Colors.white : AppColors.primaryColor),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.filter_list_rounded, size: 18.sp),
              label: Text("Filter", style: AppStyles.medium14Grey()),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: isDark ? AppColors.darkBorderColor : AppColors.borderColor),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        AttendanceLogTable(data: todayData),
      ],
    );
  }
}
