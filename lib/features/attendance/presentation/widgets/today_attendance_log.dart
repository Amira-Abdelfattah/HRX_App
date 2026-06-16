import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../manager/attendance_cubit.dart';
import '../manager/attendance_states.dart';
import 'attendance_log_table.dart';

class TodayAttendanceLog extends StatelessWidget {
  const TodayAttendanceLog({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // final List<Map<String, dynamic>> dummyData = [
    //   {
    //     'name': 'Sarah Johnson',
    //     'in': '08:55 AM',
    //     'out': '05:30 PM',
    //     'hours': '9h 15m',
    //     'status': 'present'.tr(),
    //     'color': AppColors.successColor,
    //   },
    //   {
    //     'name': 'Michael Chen',
    //     'in': '09:00 AM',
    //     'out': '06:00 PM',
    //     'hours': '9h 0m',
    //     'status': 'present'.tr(),
    //     'color': AppColors.successColor,
    //   },
    // ];

    return BlocBuilder<AttendanceCubit, AttendanceStates>(
      builder: (context, state) {
        // Combine real logs from Cubit with dummy data for display
        final List<Map<String, dynamic>> allData = [
          ...state.logs,
          //...dummyData,
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "todays_attendance".tr(),
                  style: AppStyles.bold20PrimaryDark(
                    color: isDark ? Colors.white : AppColors.primaryColor,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list_rounded, size: 18.sp),
                  label: Text("filter".tr(),
                      style: AppStyles.medium14Grey(context: context)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: isDark
                          ? AppColors.darkBorderColor
                          : AppColors.borderColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            AttendanceLogTable(data: allData),
          ],
        );
      },
    );
  }
}
