import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class EmployeesSearchFilter extends StatefulWidget {
  const EmployeesSearchFilter({super.key});

  @override
  State<EmployeesSearchFilter> createState() => _EmployeesSearchFilterState();
}

class _EmployeesSearchFilterState extends State<EmployeesSearchFilter> {
  String selectedDepartment = 'All Departments';
  final List<String> departments = [
    'All Departments',
    'Engineering',
    'Product',
    'Design',
    'Sales',
    'HR',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurfaceLightColor
                  : AppColors.surfaceColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isDark
                    ? AppColors.darkBorderColor
                    : AppColors.borderColor,
              ),
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              style: AppStyles.regular14PrimaryDark(
                color: isDark ? Colors.white : AppColors.primaryColor,
              ),
              decoration: InputDecoration(
                hintText: 'Search employees...',
                hintStyle: AppStyles.regular14Grey(),
                prefixIcon: Icon(
                  Icons.search,
                  size: 22.sp,
                  color: Colors.grey.shade600,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ),

        SizedBox(width: 12.w),

        PopupMenuButton<String>(
          onSelected: (value) => setState(() => selectedDepartment = value),
          child: Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurfaceLightColor : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isDark
                    ? AppColors.darkBorderColor
                    : AppColors.borderColor,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.filter_list,
                  size: 20.sp,
                  color: Colors.grey.shade600,
                ),
                SizedBox(width: 8.w),
                Text(
                  selectedDepartment,
                  style: AppStyles.medium14Grey(
                    color: isDark ? Colors.white : AppColors.textPrimaryColor,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20.sp,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          itemBuilder: (context) => departments
              .map(
                (dept) => PopupMenuItem(
                  value: dept,
                  child: Text(dept, style: AppStyles.regular14PrimaryDark()),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
