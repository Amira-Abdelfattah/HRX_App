import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../widgets/status_badge.dart';

class LeaveRequestCard extends StatelessWidget {
  final Map<String, dynamic> request;

  const LeaveRequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
        ),
        boxShadow: isDark ? [] : AppColors.shadowSm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    request['name'] ?? 'Unknown',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    request['type'] ?? 'leave_requests'.tr(),
                    style: AppStyles.regular14PrimaryDark(
                      color: isDark ? Colors.white70 : AppColors.textMutedColor,
                    ),
                  ),
                ],
              ),
              StatusBadge(
                text: request['status'] ?? 'pending'.tr(),
                color: request['statusColor'] ?? AppColors.warningColor,
              ),
            ],
          ),
          SizedBox(height: 20.h),

          Row(
            children: [
              Expanded(
                child: _buildDateItem(
                  context,
                  "from".tr(),
                  request['fromDate'] ?? '-',
                ),
              ),
              Expanded(
                child: _buildDateItem(
                  context,
                  "to".tr(),
                  request['toDate'] ?? '-',
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          Text(
            request['reason'] ?? '',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: isDark ? Colors.white60 : AppColors.textMutedColor,
            ),
          ),

          if (request['status'] == 'pending'.tr()) ...[
            SizedBox(height: 20.h),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.successColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    ),
                    child: Text(
                      "approve".tr(), 
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.dangerColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    ),
                    child: Text(
                      "reject".tr(), 
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDateItem(BuildContext context, String label, String date) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? Colors.white60 : AppColors.textMutedColor,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          date,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
