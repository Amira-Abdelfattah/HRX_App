import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import 'drawer_header.dart';
import 'drawer_item.dart';
import 'drawer_user_section.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor: isDark
          ? AppColors.darkSurfaceColor
          : AppColors.whiteColor,
      child: Column(
        children: [
          const DrawerHeaderWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerMenuItem(
                  icon: Icons.grid_view_rounded,
                  title: 'Dashboard',
                  isSelected: true,
                  onTap: () {},
                ),
                DrawerMenuItem(
                  icon: Icons.people_outline,
                  title: 'Employees',
                  onTap: () {},
                ),
                DrawerMenuItem(
                  icon: Icons.bolt,
                  title: 'Performix Engine',
                  onTap: () {},
                ),
                DrawerMenuItem(
                  icon: Icons.calendar_month_outlined,
                  title: 'Attendance',
                  onTap: () {},
                ),
                DrawerMenuItem(
                  icon: Icons.person_add_alt_1_outlined,
                  title: 'Recruitment',
                  onTap: () {},
                ),
                DrawerMenuItem(
                  icon: Icons.monetization_on_outlined,
                  title: 'Payroll',
                  onTap: () {},
                ),
                DrawerMenuItem(
                  icon: Icons.bar_chart_rounded,
                  title: 'Analytics',
                  onTap: () {},
                ),
                const Divider(),
                DrawerMenuItem(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () {},
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
