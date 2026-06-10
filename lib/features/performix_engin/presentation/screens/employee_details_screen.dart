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
        title: Text('Back to Employees', style: AppStyles.regular14Grey()),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(isDark),
            SizedBox(height: 24.h),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Performance Score',
                    '${employee['perf'] ?? 86}/100',
                    '↑ 5% from last month',
                    Icons.trending_up,
                    Colors.blue,
                    isDark,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildStatCard(
                    'Attendance Rate',
                    '97%',
                    '↑ 2% from last month',
                    Icons.calendar_today,
                    Colors.green,
                    isDark,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildStatCard(
                    'Join Date',
                    '-',
                    'Reporting to Michael Chen',
                    Icons.military_tech_outlined,
                    Colors.orange,
                    isDark,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildEmployeeDetails(isDark)),
                SizedBox(width: 24.w),
                Expanded(flex: 1, child: _buildQuickStats(isDark)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(bool isDark) {
    return Container(
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF818CF8), Color(0xFFC084FC)],
                      ),
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      employee['init'] ?? 'U',
                      style: AppStyles.semi24White.copyWith(fontSize: 48.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.w),
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: Color(0xFF22C55E),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 18.sp),
                  ),
                ],
              ),
              SizedBox(width: 32.w),
              // Name and Basic Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            employee['name'] ?? 'Unknown',
                            style: AppStyles.bold32PrimaryDark(
                              color: isDark
                                  ? Colors.white
                                  : AppColors.primaryColor,
                            ).copyWith(fontSize: 32.sp),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        _buildBadge('Active', const Color(0xFF22C55E)),
                      ],
                    ),
                    Text(
                      employee['role'] ?? 'Developer',
                      style: AppStyles.medium18PrimaryDark(
                        color: AppColors.primaryColor.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        const Icon(Icons.horizontal_rule, color: Colors.grey),
                        SizedBox(width: 8.w),
                        _buildIdBadge('EMP-61'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              _buildInfoChip(
                Icons.email_outlined,
                'EMAIL',
                employee['email'] ?? 'jon@gmail.com',
                isDark,
                width: 180.w,
              ),
              _buildInfoChip(
                Icons.phone_outlined,
                'PHONE',
                '-',
                isDark,
                width: 120.w,
              ),
              _buildInfoChip(
                Icons.location_on_outlined,
                'LOCATION',
                'Cairo',
                isDark,
                width: 120.w,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdBadge(String id) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(id, style: AppStyles.medium14Grey()),
    );
  }

  Widget _buildInfoChip(
    IconData icon,
    String label,
    String value,
    bool isDark, {
    double? width,
  }) {
    return Container(
      width: width,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.05)
            : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20.sp, color: AppColors.primaryColor),
          SizedBox(width: 8.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: AppStyles.medium14Grey(
                    color: isDark ? Colors.white : Colors.black87,
                  ).copyWith(fontSize: 12.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String sub,
    IconData icon,
    Color color,
    bool isDark,
  ) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.borderLightColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          SizedBox(height: 16.h),
          Text(title, style: AppStyles.regular14Grey()),
          SizedBox(height: 8.h),
          Text(
            value,
            style: AppStyles.bold32PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            sub,
            style: TextStyle(
              color: sub.startsWith('↑') ? Colors.green : Colors.grey,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeDetails(bool isDark) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Employee Details',
            style: AppStyles.bold20PrimaryDark(
              color: isDark ? Colors.white : AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 24.h),
          _buildDetailRow('Employee ID', 'EMP-61', isDark),
          _buildDetailRow('Department', employee['dept'] ?? '-', isDark),
          _buildDetailRow('Position', employee['role'] ?? '-', isDark),
          _buildDetailRow('Manager', 'Michael Chen', isDark),
          _buildDetailRow('Join Date', '-', isDark, showDivider: false),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value,
    bool isDark, {
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: AppStyles.regular14Grey()),
              Text(
                value,
                style: AppStyles.medium16PrimaryDark(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
        ),
        if (showDivider) Divider(color: Colors.grey.withOpacity(0.2)),
      ],
    );
  }

  Widget _buildQuickStats(bool isDark) {
    return Column(
      children: [
        _buildQuickStatItem(
          'Tasks Completed',
          '24/30',
          const Color(0xFFDCFCE7),
          const Color(0xFF16A34A),
        ),
        SizedBox(height: 12.h),
        _buildQuickStatItem(
          'Pending Reviews',
          '3',
          const Color(0xFFFEF9C3),
          const Color(0xFFCA8A04),
        ),
        SizedBox(height: 12.h),
        Container(
          height: 80.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFEAB308),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickStatItem(
    String label,
    String value,
    Color bgColor,
    Color textColor,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: textColor.withOpacity(0.7),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
