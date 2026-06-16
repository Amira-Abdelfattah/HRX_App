import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../widgets/status_badge.dart';

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
                    _buildHeader(context, isDark),
                    const Divider(height: 1),
                    Column(
                      children: data.asMap().entries.map((entry) {
                        int index = entry.key;
                        var item = entry.value;
                        return Column(
                          children: [
                            _buildRow(context, item, isDark),
                            if (index != data.length - 1)
                              Divider(
                                height: 1,
                                color: isDark
                                    ? AppColors.darkBorderColor
                                    : AppColors.borderColor.withValues(
                                    alpha: 0.5),
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

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      color: isDark ? AppColors.darkBackgroundColor : AppColors.backgroundColor
          .withValues(alpha: 0.5),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(flex: 3,
              child: Text(
                  'employee'.tr(),
                  style: AppStyles.semi13PrimaryDark(context: context))),
          Expanded(flex: 2,
              child: Text(
                  'check_in'.tr(),
                  style: AppStyles.semi13PrimaryDark(context: context))),
          Expanded(flex: 2,
              child: Text(
                  'check_out'.tr(),
                  style: AppStyles.semi13PrimaryDark(context: context))),
          Expanded(flex: 2,
              child: Text('hours'.tr(),
                  style: AppStyles.semi13PrimaryDark(context: context))),
          Expanded(flex: 2,
              child: Text('status'.tr(),
                  style: AppStyles.semi13PrimaryDark(context: context))),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, Map<String, dynamic> item,
      bool isDark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              item['name'],
              style: AppStyles.medium14PrimaryDark(context: context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
                item['in'], style: AppStyles.regular13Black(context: context)),
          ),
          Expanded(
            flex: 2,
            child: Text(
                item['out'], style: AppStyles.regular13Black(context: context)),
          ),
          Expanded(
            flex: 2,
            child: Text(item['hours'],
                style: AppStyles.regular13Black(context: context)),
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
