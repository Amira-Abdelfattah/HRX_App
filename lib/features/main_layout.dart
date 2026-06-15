import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/features/auth/presentation/screens/login.dart';
import 'package:hrx_app/features/payroll/payroll.dart';
import 'package:hrx_app/features/performix_engin/presentation/screens/performix_engin.dart';
import 'package:hrx_app/features/recruitment/recruitment.dart';
import 'package:hrx_app/features/settings/settings_screen.dart';
import 'package:hrx_app/features/widgets/custom_bottom_nav_bar.dart';
import 'package:hrx_app/features/widgets/custom_drawer.dart';
import 'package:hrx_app/features/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

import '../core/api/api_manager.dart';
import '../core/cache/shared_prefrence_utils.dart';
import '../core/di/service_locator.dart';
import '../core/providers/navigation_provider.dart';
import '../core/providers/theme_provider.dart';
import '../core/utils/app_colors.dart';
import 'analytics/analytics_screen.dart';
import 'attendance/presentation/attendance_screen.dart';
import 'dashboard/dashboard.dart';
import 'employees/employees.dart';

class MainLayout extends StatefulWidget {
  final String? userName;
  final String? userRole;

  const MainLayout({super.key, this.userName, this.userRole});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late String currentUserName;
  late String currentUserRole;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    currentUserName =
        widget.userName ??
        SharedPreferenceUtils.getData(key: 'user_name') as String? ??
        'User';
    currentUserRole =
        widget.userRole ??
        SharedPreferenceUtils.getData(key: 'user_role') as String? ??
        'HR Manager';
  }

  String _getUserInitials(String? name) {
    if (name == null || name.isEmpty || name == 'User Name') return 'JD';

    final parts = name.trim().split(' ');
    if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
    return name.substring(0, name.length >= 2 ? 2 : 1).toUpperCase();
  }

  void _showUserMenu(BuildContext context, String userName, String userRole) {
    final navProvider = Provider.of<NavigationProvider>(context, listen: false);

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 80.h,
              right: 16.w,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 240.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text(
                              userRole,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      _buildMenuItem(
                        context,
                        icon: Icons.settings_outlined,
                        title: 'Setting',
                        onTap: () {
                          Navigator.pop(context);
                          navProvider.setIndex(7); // Settings index
                        },
                      ),
                      const Divider(height: 1),
                      _buildMenuItem(
                        context,
                        icon: Icons.logout,
                        title: 'Logout',
                        color: Colors.red,
                        onTap: () {
                          // Clear Local Cache
                          SharedPreferenceUtils.removeData(key: 'user_name');
                          SharedPreferenceUtils.removeData(key: 'user_role');

                          // Reset ApiManager (Clear Cookies/Headers)
                          getIt<ApiManager>().resetDio();

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Icon(icon, size: 20.sp, color: color),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, color: color),
            ),
          ],
        ),
      ),
    );
  }

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

    // Refresh data to ensure it's always current
    _loadUserData();

    debugPrint('MainLayout Building with: $currentUserName');

    return Scaffold(
      drawer: CustomDrawer(
        selectedIndex: navProvider.currentIndex,
        onItemSelected: (index) {
          navProvider.setIndex(index);
          Navigator.pop(context);
        },
        userName: currentUserName,
        userRole: currentUserRole,
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
          GestureDetector(
            onTap: () =>
                _showUserMenu(context, currentUserName, currentUserRole),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.accentColor,
              child: Text(
                _getUserInitials(currentUserName),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
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
