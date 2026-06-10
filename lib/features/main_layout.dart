import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/features/payroll/payroll.dart';
import 'package:hrx_app/features/performix_engin/presentation/screens/performix_engin.dart';
import 'package:hrx_app/features/recruitment/recruitment.dart';
import 'package:hrx_app/features/settings/settings_screen.dart';
import 'package:hrx_app/features/widgets/custom_bottom_nav_bar.dart';
import 'package:hrx_app/features/widgets/custom_drawer.dart';
import 'package:hrx_app/features/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

import '../core/providers/navigation_provider.dart';
import '../core/providers/theme_provider.dart';
import '../core/utils/app_colors.dart';
import 'analytics/analytics_screen.dart';
import 'attendance/attendance_screen.dart';
import 'dashboard/dashboard.dart';
import 'employees/employees.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
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
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      drawer: CustomDrawer(
        selectedIndex: navProvider.currentIndex,
        onItemSelected: (index) {
          navProvider.setIndex(index);
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
      body: IndexedStack(index: navProvider.currentIndex, children: _pages),

      bottomNavigationBar: navProvider.currentIndex < 4
          ? CustomBottomNavBar(
              currentIndex: navProvider.currentIndex,
              onTap: (index) {
                navProvider.setIndex(index);
              },
            )
          : null,
    );
  }
}
