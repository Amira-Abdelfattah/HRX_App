import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/core/providers/theme_provider.dart';
import 'package:hrx_app/features/payroll/payroll.dart';
import 'package:hrx_app/features/performix_engin/performix_engin.dart';
import 'package:hrx_app/features/recruitment/recruitment.dart';
import 'package:hrx_app/features/settings/settings_screen.dart';
import 'package:provider/provider.dart';

import '../core/utils/app_colors.dart';
import 'analytics/analytics_screen.dart';
import 'attendance/attendance_screen.dart';
import 'dashboard/dashboard.dart';
import 'employees/employees.dart';
import 'widgets/custom_bottom_nav_bar.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/custom_search_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardScreen(),
    const EmployeesScreen(),
    const AttendanceScreen(),
    const PayrollScreen(),
    const PerformixEngineScreen(),
    const RecruitmentScreen(),
    const AnalyticsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      drawer: CustomDrawer(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        toolbarHeight: 80.h,
        title: const CustomSearchBar(),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color: themeProvider.isDarkMode ? Colors.amber : null,
            ),
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkMode);
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          const CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.accentColor,
            child: Text(
              'JD',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: _currentIndex < 4
          ? CustomBottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() => _currentIndex = index);
              },
            )
          : null,
    );
  }
}
