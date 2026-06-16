import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../presentation/manager/employees_view_model.dart';

class EmployeesSearchFilter extends StatefulWidget {
  const EmployeesSearchFilter({super.key});

  @override
  State<EmployeesSearchFilter> createState() => _EmployeesSearchFilterState();
}

class _EmployeesSearchFilterState extends State<EmployeesSearchFilter> {
  String selectedDepartmentKey = 'all_departments';
  final TextEditingController _searchController = TextEditingController();
  final List<String> departmentsKeys = [
    'all_departments',
    'engineering',
    'product',
    'design',
    'sales',
    'hr',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onChanged() {
    context.read<EmployeesViewModel>().searchAndFilter(
      query: _searchController.text,
      department: selectedDepartmentKey.tr(),
    );
  }

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
                  : AppColors.surfaceColor.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isDark
                    ? AppColors.darkBorderColor
                    : AppColors.borderColor,
              ),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (_) => _onChanged(),
              textAlignVertical: TextAlignVertical.center,
              style: AppStyles.regular14PrimaryDark(
                color: isDark ? Colors.white : AppColors.primaryColor,
              ),
              decoration: InputDecoration(
                hintText: 'search_employees_hint'.tr(),
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
          onSelected: (value) {
            setState(() => selectedDepartmentKey = value);
            _onChanged();
          },
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
                  selectedDepartmentKey.tr(),
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
          itemBuilder: (context) =>
              departmentsKeys
              .map(
                    (deptKey) =>
                    PopupMenuItem(
                      value: deptKey,
                      child: Text(deptKey.tr(),
                          style: AppStyles.regular14PrimaryDark()),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
