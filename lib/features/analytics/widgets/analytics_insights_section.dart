import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_styles.dart';

class AnalyticsInsightsSection extends StatelessWidget {
  const AnalyticsInsightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A337E), // Dark Navy Blue
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Insights',
            style: AppStyles.semi18PrimaryDark(color: Colors.white),
          ),
          SizedBox(height: 20.h),
          _buildInsightItem(
            title: 'Retention Improving',
            description:
                'Attrition rate has decreased by 0.5% this quarter, indicating improved employee satisfaction.',
          ),
          SizedBox(height: 12.h),
          _buildInsightItem(
            title: 'Hiring Momentum',
            description:
                'Strong hiring in Q2 with 67 new employees, primarily in Engineering and Sales departments.',
          ),
          SizedBox(height: 12.h),
          _buildInsightItem(
            title: 'Performance Growth',
            description:
                'Company-wide performance score increased from 82 to 90 over the last 6 months.',
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem({
    required String title,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.semi14White),
          SizedBox(height: 8.h),
          Text(
            description,
            style: AppStyles.regular12Grey(
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
