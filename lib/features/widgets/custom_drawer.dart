import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import 'drawer_item.dart';
import 'drawer_user_section.dart';
import 'hrx_logo.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor: isDark
          ? AppColors.darkSurfaceColor
          : AppColors.whiteColor,
      child: Column(
        children: [
          Container(
            height: 150.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurfaceColor
                  : AppColors.primaryColor,
            ),
            child: const HrxLogo(fontSize: 24),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerMenuItem(
                  icon: Icons.grid_view_rounded,
                  title: 'Dashboard',
                  isSelected: selectedIndex == 0,
                  onTap: () => onItemSelected(0),
                ),
                DrawerMenuItem(
                  icon: Icons.people_outline,
                  title: 'Employees',
                  isSelected: selectedIndex == 1,
                  onTap: () => onItemSelected(1),
                ),
                DrawerMenuItem(
                  icon: Icons.calendar_month_outlined,
                  title: 'Attendance',
                  isSelected: selectedIndex == 2,
                  onTap: () => onItemSelected(2),
                ),
                DrawerMenuItem(
                  icon: Icons.monetization_on_outlined,
                  title: 'Payroll',
                  isSelected: selectedIndex == 3,
                  onTap: () => onItemSelected(3),
                ),
                const Divider(),
                // ربط باقي العناصر بالأرقام الجديدة
                DrawerMenuItem(
                  icon: Icons.bolt,
                  title: 'Performix Engine',
                  isSelected: selectedIndex == 4, // رقم 4
                  onTap: () => onItemSelected(4),
                ),
                DrawerMenuItem(
                  icon: Icons.person_add_alt_1_outlined,
                  title: 'Recruitment',
                  isSelected: selectedIndex == 5, // رقم 5
                  onTap: () => onItemSelected(5),
                ),
                DrawerMenuItem(
                  icon: Icons.bar_chart_rounded,
                  title: 'Analytics',
                  isSelected: selectedIndex == 6, // رقم 6
                  onTap: () => onItemSelected(6),
                ),
                DrawerMenuItem(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  isSelected: selectedIndex == 7, // رقم 7
                  onTap: () => onItemSelected(7),
                ),
              ],
            ),
          ),
          const DrawerUserSection(),
        ],
      ),
    );
  }
}
