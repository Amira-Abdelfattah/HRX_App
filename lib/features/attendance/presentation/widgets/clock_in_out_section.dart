import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cache/shared_prefrence_utils.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../manager/attendance_cubit.dart';
import '../manager/attendance_states.dart';

class ClockInOutSection extends StatefulWidget {
  const ClockInOutSection({super.key});

  @override
  State<ClockInOutSection> createState() => _ClockInOutSectionState();
}

class _ClockInOutSectionState extends State<ClockInOutSection> {
  late Timer _timer;
  DateTime _now = DateTime.now();
  bool isCheckedIn = false;
  String? lastCheckIn;
  String? lastCheckOut;
  double workedHours = 0.0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _now = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocListener<AttendanceCubit, AttendanceStates>(
      listener: (context, state) {
        if (state is AttendanceLoadingState) {
          DialogUtils.showLoading(context: context, message: "processing".tr());
        } else if (state is AttendanceErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            title: "error".tr(),
          );
        } else if (state is CheckInSuccessState) {
          DialogUtils.hideLoading(context);
          setState(() {
            isCheckedIn = true;
            lastCheckIn = state.response.checkIn;
          });
          _showSuccessDialog(
              context, "checked_in_success".tr(), state.response.message);
        } else if (state is CheckOutSuccessState) {
          DialogUtils.hideLoading(context);
          setState(() {
            isCheckedIn = false;
            lastCheckOut = state.response.checkOut;
            workedHours = state.response.workedHours ?? 0.0;
          });
          _showSuccessDialog(
            context,
            "checked_out_success".tr(),
            "${state.response.message}. ${'worked_hours_info'.tr(
                args: [workedHours.toStringAsFixed(2)])}",
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurfaceColor : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat(
                          'EEEE, MMMM dd, yyyy',
                            context.locale.languageCode
                        ).format(_now).toUpperCase(),
                        style: AppStyles
                            .medium12Grey(context: context)
                            .copyWith(
                          color: AppColors.warningColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat('hh:mm:ss a', context.locale.languageCode)
                              .format(_now),
                          style: AppStyles.semi24PrimaryDark(
                            context: context,
                            color: isDark
                                ? Colors.white
                                : AppColors.primaryColor,
                          ).copyWith(fontSize: 32.sp),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10.sp,
                            color: isCheckedIn
                                ? AppColors.successColor
                                : AppColors.neutralColor,
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
                            child: Text(
                              "${'status_label'.tr()}: ${isCheckedIn
                                  ? 'checked_in'.tr()
                                  : 'checked_out'.tr()}",
                              style: AppStyles.medium14Grey(context: context),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 140.w,
                  height: 45.h,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final employeeId =
                          SharedPreferenceUtils.getData(key: 'user_id')
                              as int? ??
                          5;
                      if (isCheckedIn) {
                        context.read<AttendanceCubit>().checkOut(employeeId);
                      } else {
                        context.read<AttendanceCubit>().checkIn(employeeId);
                      }
                    },
                    icon: Icon(
                      isCheckedIn ? Icons.stop : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    label: Text(
                      isCheckedIn ? "clock_out".tr() : "clock_in".tr(),
                      style: AppStyles.semi14White(context: context),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isCheckedIn
                          ? AppColors.dangerColor
                          : AppColors.successColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                constraints: BoxConstraints(maxWidth: 0.7.sw),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14.sp,
                      color: AppColors.warningColor,
                    ),
                    SizedBox(width: 4.w),
                    Flexible(
                      child: Text(
                        "gps_location_info".tr(),
                        style: AppStyles
                            .regular10Grey(context: context)
                            .copyWith(
                          fontSize: 11.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 30.h,
              color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTimeInfo(
                  "last_check_in_caps".tr(),
                  lastCheckIn ?? "not_yet".tr(),
                  isDark,
                ),
                SizedBox(height: 12.h),
                _buildTimeInfo(
                  "last_check_out_caps".tr(),
                  lastCheckOut ??
                      (isCheckedIn ? "active_session".tr() : "not_yet".tr()),
                  isDark,
                ),
                SizedBox(height: 12.h),
                _buildTimeInfo(
                  "hours_worked_caps".tr(),
                  'worked_hours_value'.tr(
                      args: [workedHours.toStringAsFixed(2)]),
                  isDark,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInfo(String label, String value, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.bold10Grey(context: context),
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: AppStyles.semi14PrimaryDark(
            context: context,
            color: isDark ? Colors.white : AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.successColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_rounded,
                color: AppColors.successColor,
                size: 40.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Text(title, style: AppStyles.semi18PrimaryDark(context: context)),
            SizedBox(height: 8.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppStyles.medium14Grey(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
