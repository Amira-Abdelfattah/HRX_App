import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/features/recruitment/widgets/hiring_piprline_view.dart';
import 'package:hrx_app/features/recruitment/widgets/job_listing_view.dart';
import 'package:hrx_app/features/recruitment/widgets/recruitment_tabs.dart';

import '../widgets/custom_page_header.dart';
import '../widgets/stat_card.dart';
import 'widgets/candidate_ranking_view.dart';

class RecruitmentScreen extends StatefulWidget {
  const RecruitmentScreen({super.key});

  @override
  State<RecruitmentScreen> createState() => _RecruitmentScreenState();
}

class _RecruitmentScreenState extends State<RecruitmentScreen> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPageHeader(
            title: 'Recruitment',
            subtitle: 'Manage job listings and candidate applications',
            actionLabel: 'Post New Job',
            actionIcon: Icons.add,
            onActionPressed: () {},
          ),
          SizedBox(height: 24.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                _buildStatItem(
                  title: 'Open Positions',
                  value: '24',
                  icon: Icons.business_center_outlined,
                  color: Colors.blue,
                ),
                SizedBox(width: 12.w),
                _buildStatItem(
                  title: 'Total Applicants',
                  value: '210',
                  icon: Icons.people_outline,
                  color: Colors.teal,
                ),
                SizedBox(width: 12.w),
                _buildStatItem(
                  title: 'In Interview',
                  value: '28',
                  icon: Icons.access_time,
                  color: Colors.orange,
                ),
                SizedBox(width: 12.w),
                _buildStatItem(
                  title: 'Hired This Month',
                  value: '5',
                  icon: Icons.trending_up,
                  color: Colors.green,
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          RecruitmentTabs(
            activeTab: _activeTab,
            onTabChanged: (index) => setState(() => _activeTab = index),
          ),
          SizedBox(height: 24.h),

          _buildActiveView(),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return SizedBox(
      width: 160.w,
      child: StatCard(title: title, value: value, icon: icon, color: color),
    );
  }

  Widget _buildActiveView() {
    switch (_activeTab) {
      case 0:
        return const CandidateRankingView();
      case 1:
        return const JobListingsView();
      case 2:
        return const HiringPipelineView();
      default:
        return const CandidateRankingView();
    }
  }
}
