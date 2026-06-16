import 'package:easy_localization/easy_localization.dart';
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
            'key_insights'.tr(),
            style: AppStyles.semi18PrimaryDark(
                context: context, color: Colors.white),
          ),
          SizedBox(height: 20.h),
          _buildInsightItem(
            context,
            title: 'retention_improving'.tr(),
            description: 'retention_desc'.tr(),
          ),
          SizedBox(height: 12.h),
          _buildInsightItem(
            context,
            title: 'hiring_momentum'.tr(),
            description: 'hiring_desc'.tr(),
          ),
          SizedBox(height: 12.h),
          _buildInsightItem(
            context,
            title: 'performance_growth'.tr(),
            description: 'performance_growth_desc'.tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem(BuildContext context, {
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
          Text(title, style: AppStyles.semi14White(context: context)),
          SizedBox(height: 8.h),
          Text(
            description,
            style: AppStyles.regular12Grey(
              context: context,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
