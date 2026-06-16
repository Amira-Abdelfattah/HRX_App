import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_page_header.dart';
import '../domain/entities/time_off_type_entity.dart';
import 'manager/time_off_cubit.dart';
import 'manager/time_off_states.dart';
import 'widgets/leave_balance_details.dart';
import 'widgets/my_requests_tab.dart';
import 'widgets/new_request_dialog.dart';
import 'widgets/pending_approvals_tab.dart';
import 'widgets/team_schedule_tab.dart';
import 'widgets/this_year_stats.dart';
import 'widgets/time_off_summary_card.dart';
import 'widgets/upcoming_approved.dart';

class TimeOffScreen extends StatelessWidget {
  const TimeOffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TimeOffCubit>()..loadTimeOffData(),
      child: const TimeOffScreenContent(),
    );
  }
}

class TimeOffScreenContent extends StatefulWidget {
  const TimeOffScreenContent({super.key});

  @override
  State<TimeOffScreenContent> createState() => _TimeOffScreenContentState();
}

class _TimeOffScreenContentState extends State<TimeOffScreenContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkBackgroundColor
          : AppColors.backgroundColor,
      body: BlocBuilder<TimeOffCubit, TimeOffStates>(
        builder: (context, state) {
          if (state is TimeOffLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TimeOffErrorState) {
            return Center(child: Text(state.message));
          } else if (state is TimeOffSuccessState) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPageHeader(
                    title: 'Time Off',
                    subtitle:
                        'Manage leave requests and track your time-off balances',
                    actionLabel: 'Request Time Off',
                    actionIcon: Icons.add,
                    onActionPressed: () {
                      _showNewRequestDialog(context, state.types);
                    },
                  ),
                  SizedBox(height: 24.h),

                  SizedBox(
                    height: 170.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      itemCount: state.types.length > 5
                          ? 5
                          : state.types.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 16.w),
                      itemBuilder: (context, index) {
                        final type = state.types[index];
                        return TimeOffSummaryCard(
                          title: type.displayName,
                          total: type.virtualRemainingLeaves.toInt().toString(),
                          used: '0',
                          // Odoo does not provide 'used' directly in this call, or we can calculate it
                          left: '${type.virtualRemainingLeaves.toInt()}d',
                          color: _getTypeColor(index),
                          icon: _getTypeIcon(index),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 24.h),

                  Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkSurfaceColor
                          : AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: isDark ? null : AppColors.shadowSm,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 1.sw - 40.w),
                        child: TabBar(
                          onTap: (index) {
                            setState(() {});
                          },
                          controller: _tabController,
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.primaryColor,
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          labelColor: Colors.white,
                          unselectedLabelColor: isDark
                              ? AppColors.darkTextBody
                              : AppColors.textMutedColor,
                          labelStyle: AppStyles.semi14White,
                          unselectedLabelStyle: AppStyles.regular14Grey(
                            context: context,
                          ),
                          padding: EdgeInsets.all(4.w),
                          tabs: const [
                            Tab(text: 'Overview'),
                            Tab(text: 'My Requests'),
                            Tab(text: 'Pending Approvals'),
                            Tab(text: 'Team\'s Schedule'),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _buildTabContent(_tabController.index, state),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Color _getTypeColor(int index) {
    List<Color> colors = [
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.blue,
    ];
    return colors[index % colors.length];
  }

  IconData _getTypeIcon(int index) {
    List<IconData> icons = [
      Icons.park_outlined,
      Icons.favorite_border,
      Icons.wb_sunny_outlined,
      Icons.history_edu_outlined,
      Icons.work_outline,
    ];
    return icons[index % icons.length];
  }

  Widget _buildTabContent(int index, TimeOffSuccessState state) {
    switch (index) {
      case 0:
        return Column(
          key: const ValueKey(0),
          children: [
            LeaveBalanceDetails(types: state.types),
            SizedBox(height: 24.h),
            const ThisYearStats(),
            SizedBox(height: 24.h),
            const UpcomingApproved(),
          ],
        );
      case 1:
        return MyRequestsTab(
          onNewRequest: () => _showNewRequestDialog(context, state.types),
          requests: state.myRequests,
        );
      case 2:
        return const PendingApprovalsTab();
      case 3:
        return TeamScheduleTab(employees: state.employees);
      default:
        return const SizedBox.shrink();
    }
  }

  void _showNewRequestDialog(
    BuildContext context,
    List<TimeOffTypeEntity> types,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: BlocProvider.of<TimeOffCubit>(context),
          child: NewRequestDialog(types: types),
        );
      },
    );
  }
}
