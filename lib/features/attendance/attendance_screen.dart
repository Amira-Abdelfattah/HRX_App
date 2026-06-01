import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_colors.dart';
import '../widgets/custom_page_header.dart';
import 'widgets/attendance_stats_grid.dart';
import 'widgets/attendance_tabs.dart';
import 'widgets/today_attendance_log.dart';
import 'widgets/attendance_history_view.dart';
import 'widgets/leave_requests_view.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark ? AppColors.darkBackgroundColor : AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
            child: CustomPageHeader(
              title: "Attendance & Leave",
              subtitle: "Track employee attendance and manage leave requests",
              actionLabel: "Export Report",
              actionIcon: Icons.file_download_outlined,
              onActionPressed: () {},
            ),
          ),
          
          // Stats Grid
          const AttendanceStatsGrid(),
          
          // Tabs and Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  AttendanceTabs(tabController: _tabController),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        TodayAttendanceLog(),
                        AttendanceHistoryView(),
                        LeaveRequestsView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
