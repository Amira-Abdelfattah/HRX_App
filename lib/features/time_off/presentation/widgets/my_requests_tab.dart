import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/time_off_request_entity.dart';

class MyRequestsTab extends StatelessWidget {
  final VoidCallback onNewRequest;
  final List<TimeOffRequest> requests;

  const MyRequestsTab({
    super.key,
    required this.onNewRequest,
    required this.requests,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: isDark ? null : AppColors.shadowSm,
            border: isDark
                ? Border.all(color: AppColors.darkBorderColor)
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Leave Requests',
                    style: AppStyles.semi18PrimaryDark(context: context),
                  ),
                  ElevatedButton.icon(
                    onPressed: onNewRequest,
                    icon: Icon(Icons.add, size: 16.sp, color: Colors.white),
                    label: Text('New Request', style: AppStyles.semi12White),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  horizontalMargin: 0,
                  columnSpacing: 20.w,
                  columns: [
                    DataColumn(
                      label: Text(
                        'LEAVE TYPE',
                        style: AppStyles.bold10Grey(context: context),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'FROM',
                        style: AppStyles.bold10Grey(context: context),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'TO',
                        style: AppStyles.bold10Grey(context: context),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'DAYS',
                        style: AppStyles.bold10Grey(context: context),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'STATUS',
                        style: AppStyles.bold10Grey(context: context),
                      ),
                    ),
                  ],
                  rows: requests.isEmpty
                      ? [
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  'No requests yet',
                                  style: AppStyles.regular12Grey(
                                    context: context,
                                  ),
                                ),
                              ),
                              const DataCell(Text('')),
                              const DataCell(Text('')),
                              const DataCell(Text('')),
                              const DataCell(Text('')),
                            ],
                          ),
                        ]
                      : requests.map((request) {
                          Color statusColor;
                          switch (request.status.toLowerCase()) {
                            case 'approved':
                              statusColor = Colors.green;
                              break;
                            case 'pending':
                              statusColor = Colors.orange;
                              break;
                            case 'rejected':
                              statusColor = Colors.red;
                              break;
                            default:
                              statusColor = Colors.grey;
                          }
                          return _buildDataRow(
                            context,
                            request.typeName,
                            request.startDate,
                            request.endDate,
                            request.duration,
                            request.status,
                            statusColor,
                          );
                        }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  DataRow _buildDataRow(
    BuildContext context,
    String type,
    String from,
    String to,
    String days,
    String status,
    Color statusColor,
  ) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 14.sp,
                color: AppColors.textMutedColor,
              ),
              SizedBox(width: 8.w),
              Text(
                type,
                style: AppStyles.medium14PrimaryDark(context: context),
              ),
            ],
          ),
        ),
        DataCell(Text(from, style: AppStyles.regular12Grey(context: context))),
        DataCell(Text(to, style: AppStyles.regular12Grey(context: context))),
        DataCell(
          Text(days, style: AppStyles.bold14PrimaryDark(context: context)),
        ),
        DataCell(
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: statusColor.withOpacity(0.5)),
            ),
            child: Text(
              status,
              style: AppStyles.bold10Grey(color: statusColor),
            ),
          ),
        ),
      ],
    );
  }
}
