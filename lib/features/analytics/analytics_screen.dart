import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_page_header.dart';
import 'widgets/analytics_charts_section.dart';
import 'widgets/analytics_insights_section.dart';
import 'widgets/analytics_stats_section.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header
              CustomPageHeader(
                title: 'analytics_reports'.tr(),
                subtitle: 'hr_insights'.tr(),
              ),
              SizedBox(height: 24.h),

              // 2. Stats Cards Section
              const AnalyticsStatsSection(),
              SizedBox(height: 24.h),

              // 3. Charts Section
              const AnalyticsChartsSection(),
              SizedBox(height: 24.h),

              // 4. Key Insights Section
              const AnalyticsInsightsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
