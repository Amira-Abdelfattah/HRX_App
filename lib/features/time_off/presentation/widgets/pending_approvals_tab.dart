import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/time_off_request_entity.dart';

class PendingApprovalsTab extends StatelessWidget {
  final List<TimeOffRequest> requests;

  const PendingApprovalsTab({super.key, required this.requests});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final pendingRequests = requests.where((r) =>
    r.status.toLowerCase() == 'pending').toList();

    if (pendingRequests.isEmpty) {
      return _buildEmptyState(context, isDark);
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isDark ? null : AppColors.shadowSm,
        border: isDark ? Border.all(color: AppColors.darkBorderColor) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pending for Approval',
            style: AppStyles.semi18PrimaryDark(context: context),
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pendingRequests.length,
            separatorBuilder: (context, index) =>
                Divider(height: 24.h,
                color: AppColors.borderColor.withOpacity(0.5)),
            itemBuilder: (context, index) {
              final request = pendingRequests[index];
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.hourglass_empty, color: Colors.orange,
                        size: 20.sp),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(request.typeName,
                            style: AppStyles.semi14PrimaryDark(
                                context: context)),
                        Text('${request.startDate} - ${request.endDate}',
                            style: AppStyles.regular12Grey(context: context)),
                      ],
                    ),
                  ),
                  Text(request.duration,
                      style: AppStyles.bold14PrimaryDark(context: context)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isDark) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isDark ? null : AppColors.shadowSm,
        border: isDark ? Border.all(color: AppColors.darkBorderColor) : null,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
                Icons.check_circle_outline, color: Colors.green, size: 40.sp),
          ),
          SizedBox(height: 20.h),
          Text('All Caught Up!',
              style: AppStyles.semi18PrimaryDark(context: context)),
          SizedBox(height: 8.h),
          Text(
            'No pending leave requests require your attention right now.',
            style: AppStyles.regular14Grey(context: context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
