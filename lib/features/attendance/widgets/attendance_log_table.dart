import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/status_badge.dart';

class AttendanceLogTable extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const AttendanceLogTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double minWidth = 550.w;
          final double tableWidth = constraints.maxWidth > minWidth ? constraints.maxWidth : minWidth;

          return ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: tableWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(isDark),
                    const Divider(height: 1),
                    Column(
                      children: data.asMap().entries.map((entry) {
                        int index = entry.key;
                        var item = entry.value;
                        return Column(
                          children: [
                            _buildRow(item, isDark),
                            if (index != data.length - 1)
                              Divider(
                                height: 1,
                                color: isDark ? AppColors.darkBorderColor : AppColors.borderColor.withOpacity(0.5),
                              ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Container(
      color: isDark ? AppColors.darkBackgroundColor : AppColors.backgroundColor.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text('Employee', style: AppStyles.semi13PrimaryDark())),
          Expanded(flex: 2, child: Text('Check In', style: AppStyles.semi13PrimaryDark())),
          Expanded(flex: 2, child: Text('Check Out', style: AppStyles.semi13PrimaryDark())),
          Expanded(flex: 2, child: Text('Hours', style: AppStyles.semi13PrimaryDark())),
          Expanded(flex: 2, child: Text('Status', style: AppStyles.semi13PrimaryDark())),
        ],
      ),
    );
  }

  Widget _buildRow(Map<String, dynamic> item, bool isDark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              item['name'],
              style: AppStyles.medium14PrimaryDark(color: isDark ? Colors.white : AppColors.primaryColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(item['in'], style: AppStyles.regular13Black(color: isDark ? Colors.white70 : AppColors.blackColor)),
          ),
          Expanded(
            flex: 2,
            child: Text(item['out'], style: AppStyles.regular13Black(color: isDark ? Colors.white70 : AppColors.blackColor)),
          ),
          Expanded(
            flex: 2,
            child: Text(item['hours'], style: AppStyles.regular13Black(color: isDark ? Colors.white70 : AppColors.blackColor)),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: StatusBadge(text: item['status'], color: item['color']),
            ),
          ),
        ],
      ),
    );
  }
}
