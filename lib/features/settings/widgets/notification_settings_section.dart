import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/theme_provider.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'setting_section_card.dart';

class NotificationSettingsSection extends StatelessWidget {
  const NotificationSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return SettingSectionCard(
      title: 'Notification Settings',
      subtitle: 'Choose what alerts you receive',
      icon: Icons.notifications_none_outlined,
      iconColor: Colors.orange,
      child: Column(
        children: [
          _buildSwitchItem(
            'Email',
            'Receive notifications via email',
            themeProvider.emailNotifications,
            (val) => themeProvider.updateNotificationSetting(
              ThemeProvider.emailKey,
              val,
            ),
          ),
          _buildSwitchItem(
            'Push',
            'Receive push notifications',
            themeProvider.pushNotifications,
            (val) => themeProvider.updateNotificationSetting(
              ThemeProvider.pushKey,
              val,
            ),
          ),
          _buildSwitchItem(
            'Performance Alerts',
            'Get alerted about performance changes',
            themeProvider.performanceAlerts,
            (val) => themeProvider.updateNotificationSetting(
              ThemeProvider.perfKey,
              val,
            ),
          ),
          _buildSwitchItem(
            'Leave Requests',
            'Notifications for leave approvals',
            themeProvider.leaveRequests,
            (val) => themeProvider.updateNotificationSetting(
              ThemeProvider.leaveKey,
              val,
            ),
          ),
          _buildSwitchItem(
            'New Hires',
            'Get notified when new employees join',
            themeProvider.newHires,
            (val) => themeProvider.updateNotificationSetting(
              ThemeProvider.hiresKey,
              val,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchItem(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.medium14PrimaryDark()),
                Text(subtitle, style: AppStyles.regular12Grey()),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.primaryColor,
            activeTrackColor: AppColors.primaryColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
