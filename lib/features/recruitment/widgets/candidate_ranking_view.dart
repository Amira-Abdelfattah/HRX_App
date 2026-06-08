import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../widgets/status_badge.dart';

class CandidateRankingView extends StatelessWidget {
  const CandidateRankingView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, dynamic>> candidates = [
      {
        'name': 'Alice Cooper',
        'role': 'Senior Frontend Developer',
        'email': 'alice@email.com',
        'phone': '+1 234 567 8900',
        'score': '95',
        'status': 'Interview',
        'statusColor': AppColors.warningColor,
        'rankColor': const Color(0xFFEAB308),
        'tags': ['React', 'TypeScript', 'Node.js'],
      },
      {
        'name': 'Carol Davis',
        'role': 'UX Designer',
        'email': 'carol@email.com',
        'phone': '+1 234 567 8901',
        'score': '92',
        'status': 'Offer',
        'statusColor': AppColors.secondaryColor,
        'rankColor': const Color(0xFF94A3B8),
        'tags': ['Figma', 'User Research', 'Prototyping'],
      },
      {
        'name': 'David Lee',
        'role': 'Senior Backend Developer',
        'email': 'david@email.com',
        'phone': '+1 234 567 8902',
        'score': '91',
        'status': 'Interview',
        'statusColor': AppColors.warningColor,
        'rankColor': const Color(0xFFD97706),
        'tags': ['Go', 'Kubernetes', 'PostgreSQL'],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Candidates',
                  style: AppStyles.semi18PrimaryDark(
                    color: isDark ? Colors.white : AppColors.primaryColor,
                  ),
                ),
                Text(
                  'AI-ranked candidates based on skills match',
                  style: AppStyles.regular12Grey(),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Row(
                children: [
                  Icon(Icons.filter_list, size: 16.sp, color: Colors.grey),
                  SizedBox(width: 4.w),
                  Text('Filter', style: AppStyles.medium12Grey()),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: candidates.length,
          itemBuilder: (context, index) {
            final c = candidates[index];
            return Container(
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.all(12.w),
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
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: BoxDecoration(
                          color: c['rankColor'],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: AppStyles.semi14White,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c['name'],
                              style: AppStyles.bold36PrimaryDark(
                                color: isDark
                                    ? Colors.white
                                    : AppColors.primaryColor,
                              ).copyWith(fontSize: 16.sp),
                            ),
                            Text(c['role'], style: AppStyles.regular12Grey()),
                            SizedBox(height: 4.h),
                            Text(
                              '${c['email']}  •  ${c['phone']}',
                              style: AppStyles.regular10Grey(),
                            ),

                            SizedBox(height: 12.h),
                            Wrap(
                              spacing: 8.w,
                              runSpacing: 4.h,
                              children: (c['tags'] as List<String>)
                                  .map(
                                    (tag) => Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 4.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? AppColors.darkSurfaceLightColor
                                            : AppColors.surfaceLightColor,
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                      ),
                                      child: Text(
                                        tag,
                                        style: AppStyles.regular10Grey(
                                          color: isDark
                                              ? Colors.white70
                                              : Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StatusBadge(
                                  text: c['status'],
                                  color: c['statusColor'],
                                ),

                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(0, 0),
                                  ),
                                  child: Text(
                                    'View Profile',
                                    style: AppStyles.medium16PrimaryDark(
                                      color: AppColors.primaryColor,
                                    ).copyWith(fontSize: 12.sp),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Colors.orange,
                                size: 18.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                c['score'],
                                style: AppStyles.bold20PrimaryDark(
                                  color: isDark
                                      ? Colors.white
                                      : AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Best Fit',
                            style:
                                AppStyles.bold28Primary(
                                  color: AppColors.successColor,
                                ).copyWith(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
