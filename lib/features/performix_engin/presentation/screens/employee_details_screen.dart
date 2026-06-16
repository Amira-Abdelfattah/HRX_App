import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> employee;

  const EmployeeDetailsScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkBackgroundColor
          : const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : AppColors.primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'back_to_employees'.tr(),
          style: AppStyles.regular14Grey(context: context),
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(context, isDark),
            SizedBox(height: 20.h),

            // Main Performance Stat
            _buildStatCard(
              context,
              'performance_score'.tr(),
              '${employee['perf'] ?? 86}/100',
              'from_last_month'.tr(args: ['↑ 5%']),
              Icons.trending_up,
              Colors.blue,
              isDark,
            ),
            SizedBox(height: 16.h),

            // Secondary Stats
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    'attendance'.tr(),
                    '97%',
                    'from_last_month'.tr(args: ['↑ 2%']),
                    Icons.calendar_today,
                    Colors.green,
                    isDark,
                    compact: true,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildStatCard(
                    context,
                    'join_date'.tr(),
                    '-',
                    'reporting_to'.tr(args: ['M. Chen']),
                    Icons.military_tech_outlined,
                    Colors.orange,
                    isDark,
                    compact: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            _buildEmployeeDetails(context, isDark),
            SizedBox(height: 20.h),

            _buildQuickStats(context, isDark),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, bool isDark) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 90.w,
                  height: 90.w,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF818CF8), Color(0xFFC084FC)],
                    ),
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    employee['init'] ?? 'U',
                    style: AppStyles.semi24White(context: context).copyWith(
                        fontSize: 36.sp),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2.w),
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 12.sp),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Name and Role
          Text(
            employee['name'] ?? 'Unknown',
            style: AppStyles.bold32PrimaryDark(context: context).copyWith(
                fontSize: 24.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            employee['role'] ?? 'Developer',
            style: AppStyles.medium14Grey(
              context: context,
              color: AppColors.primaryColor.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBadge('active'.tr(), const Color(0xFF22C55E)),
              SizedBox(width: 8.w),
              _buildIdBadge(context, 'EMP-61'),
            ],
          ),

          SizedBox(height: 24.h),
          Divider(color: Colors.grey.withValues(alpha: 0.1)),
          SizedBox(height: 16.h),

          // Contact Info
          _buildInfoChip(
            context,
            Icons.email_outlined,
            'email_address_caps'.tr(),
            employee['email'] ?? 'jon@gmail.com',
            isDark,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: _buildInfoChip(
                  context,
                  Icons.phone_outlined,
                  'phone_caps'.tr(),
                  '-',
                  isDark,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildInfoChip(
                  context,
                  Icons.location_on_outlined,
                  'location_caps'.tr(),
                  'Cairo',
                  isDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 6.w),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdBadge(BuildContext context, String id) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        id,
        style: AppStyles.medium12Grey(context: context).copyWith(
            fontSize: 11.sp),
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context,
    IconData icon,
    String label,
    String value,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, size: 16.sp, color: AppColors.primaryColor),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  value,
                  style: AppStyles.medium14Grey(context: context).copyWith(
                      fontSize: 12.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context,
    String title,
    String value,
    String sub,
    IconData icon,
    Color color,
    bool isDark, {
    bool compact = false,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(icon, color: color, size: compact ? 18.sp : 22.sp),
              ),
              if (!compact)
                Icon(Icons.more_horiz, color: Colors.grey[400], size: 18.sp),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: AppStyles.regular12Grey(context: context).copyWith(
                fontSize: 12.sp),
          ),
          SizedBox(height: 4.h),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppStyles.bold32PrimaryDark(context: context)
                  .copyWith(fontSize: compact ? 22.sp : 28.sp),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            sub,
            style: TextStyle(
              color: sub.contains('↑') ? Colors.green : Colors.grey[500],
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeDetails(BuildContext context, bool isDark) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'employee_details'.tr(),
            style: AppStyles.bold20PrimaryDark(context: context).copyWith(
                fontSize: 18.sp),
          ),
          SizedBox(height: 16.h),
          _buildDetailRow(context, 'employee_id'.tr(), 'EMP-61', isDark),
          _buildDetailRow(
              context, 'department'.tr(), employee['dept'] ?? '-', isDark),
          _buildDetailRow(
              context, 'position'.tr(), employee['role'] ?? '-', isDark),
          _buildDetailRow(context, 'manager'.tr(), 'Michael Chen', isDark),
          _buildDetailRow(
              context, 'join_date'.tr(), '-', isDark, showDivider: false),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context,
    String label,
    String value,
    bool isDark, {
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppStyles.regular14Grey(context: context).copyWith(
                    fontSize: 13.sp),
              ),
              Text(
                value,
                style: AppStyles.medium14Grey(context: context).copyWith(
                    fontSize: 13.sp),
              ),
            ],
          ),
        ),
        if (showDivider) Divider(color: Colors.grey.withValues(alpha: 0.08)),
      ],
    );
  }

  Widget _buildQuickStats(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
          child: Text(
            'quick_stats'.tr(),
            style: AppStyles.bold20PrimaryDark(context: context),
          ),
        ),
        _buildQuickStatItem(
          'tasks_completed'.tr(),
          '24/30',
          const Color(0xFFDCFCE7),
          const Color(0xFF16A34A),
          Icons.task_alt,
        ),
        SizedBox(height: 12.h),
        _buildQuickStatItem(
          'activity_pending_reviews_title'.tr(),
          '3',
          const Color(0xFFFEF9C3),
          const Color(0xFFCA8A04),
          Icons.rate_review_outlined,
        ),
      ],
    );
  }

  Widget _buildQuickStatItem(
    String label,
    String value,
    Color bgColor,
    Color textColor,
    IconData icon,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: textColor, size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: textColor.withValues(alpha: 0.8),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
