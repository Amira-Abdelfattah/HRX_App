import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widgets/status_badge.dart';

class JobListingsView extends StatelessWidget {
  const JobListingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final List<Map<String, dynamic>> jobs = [
      {
        'title': 'Senior Frontend Developer',
        'dept': 'Engineering',
        'type': 'Full-time',
        'location': 'San Francisco, CA',
        'salary': '\$120k - \$160k',
        'applicants': '45',
        'status': 'Active',
        'statusColor': AppColors.successColor,
      },
      {
        'title': 'Product Manager',
        'dept': 'Product',
        'type': 'Full-time',
        'location': 'New York, NY',
        'salary': '\$130k - \$180k',
        'applicants': '32',
        'status': 'Active',
        'statusColor': AppColors.successColor,
      },
      {
        'title': 'UX Designer',
        'dept': 'Design',
        'type': 'Full-time',
        'location': 'Remote',
        'salary': '\$90k - \$130k',
        'applicants': '67',
        'status': 'Active',
        'statusColor': AppColors.successColor,
      },
      {
        'title': 'Sales Executive',
        'dept': 'Sales',
        'type': 'Full-time',
        'location': 'Chicago, IL',
        'salary': '\$80k - \$110k',
        'applicants': '28',
        'status': 'Closed',
        'statusColor': Colors.grey,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisExtent: 260.h,
        mainAxisSpacing: 16.h,
      ),
      itemBuilder: (context, index) {
        final job = jobs[index];
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurfaceColor : Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isDark
                  ? AppColors.darkBorderColor
                  : AppColors.borderLightColor,
            ),
            boxShadow: isDark
                ? []
                : [
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
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.business_center,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    ),
                  ),
                  StatusBadge(text: job['status'], color: job['statusColor']),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                job['title'],
                style: AppStyles.semi16PrimaryDark(
                  color: isDark ? Colors.white : AppColors.primaryColor,
                ),
              ),
              Text(job['dept'], style: AppStyles.regular12Grey()),

              SizedBox(height: 16.h),
              Row(
                children: [
                  _buildMetaItem(Icons.access_time, job['type']),
                  SizedBox(width: 16.w),
                  _buildMetaItem(Icons.location_on_outlined, job['location']),
                ],
              ),
              SizedBox(height: 8.h),
              _buildMetaItem(Icons.attach_money, job['salary']),

              const Spacer(),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.people_outline,
                        size: 16.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${job['applicants']} applicants',
                        style: AppStyles.medium12Grey(),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'View Details',
                      style: AppStyles.medium14PrimaryDark(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMetaItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.sp, color: Colors.grey),
        SizedBox(width: 4.w),
        Text(text, style: AppStyles.regular11Grey()),
      ],
    );
  }
}
