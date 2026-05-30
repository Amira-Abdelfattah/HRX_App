import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/app_colors.dart';
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
    const Center(child: Text("Attendance Page")),
    const Center(child: Text("Payroll Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: 80.h,
        title: const CustomSearchBar(),
        actions: [
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
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
