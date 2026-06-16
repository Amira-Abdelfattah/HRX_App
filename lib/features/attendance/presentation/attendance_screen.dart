import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/features/attendance/presentation/widgets/attendance_history_view.dart';
import 'package:hrx_app/features/attendance/presentation/widgets/attendance_stats_grid.dart';
import 'package:hrx_app/features/attendance/presentation/widgets/attendance_tabs.dart';
import 'package:hrx_app/features/attendance/presentation/widgets/clock_in_out_section.dart';
import 'package:hrx_app/features/attendance/presentation/widgets/leave_requests_view.dart';
import 'package:hrx_app/features/attendance/presentation/widgets/today_attendance_log.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/utils/app_colors.dart';
import '../../widgets/custom_page_header.dart';
import 'manager/attendance_cubit.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => getIt<AttendanceCubit>()..loadTodayAttendance(),
      child: Container(
        color: isDark
            ? AppColors.darkBackgroundColor
            : AppColors.backgroundColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                child: Builder(
                  builder: (context) {
                    return CustomPageHeader(
                      title: "attendance_leave".tr(),
                      subtitle: "track_attendance".tr(),
                      actionLabel: "refresh".tr(),
                      actionIcon: Icons.refresh_rounded,
                      onActionPressed: () {
                        context.read<AttendanceCubit>().loadTodayAttendance();
                      },
                    );
                  },
                ),
              ),

              // Stats Grid
              const AttendanceStatsGrid(),

              // Clock In/Out Section
              const ClockInOutSection(),

              // Tabs Navigation
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AttendanceTabs(tabController: _tabController),
              ),

              SizedBox(height: 20.h),

              // Tab Content Area
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  height: 600.h, // Initial fixed height, will optimize later
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      TodayAttendanceLog(),
                      AttendanceHistoryView(),
                      LeaveRequestsView(),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
