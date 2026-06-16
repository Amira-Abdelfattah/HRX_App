import 'package:easy_localization/easy_localization.dart';
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
      title: 'notification_settings'.tr(),
      subtitle: 'choose_alerts'.tr(),
      icon: Icons.notifications_none_outlined,
      iconColor: Colors.orange,
      child: Column(
        children: [
          _buildSwitchItem(
            'email'.tr(),
            'receive_email_notifications'.tr(),
            themeProvider.emailNotifications,
            (val) => themeProvider.updateNotificationSetting(
              ThemeProvider.emailKey,
              val,
            ),
          ),
          _buildSwitchItem(
            'push'.tr(),
            'receive_push_notifications'.tr(),
            themeProvider.pushNotifications,
            (val) => themeProvider.updateNotificationSetting(
              ThemeProvider.pushKey,
              val,
            ),
          ),
          _buildSwitchItem(
            'performance_alerts'.tr(),
            'get_performance_alerts'.tr(),
            themeProvider.performanceAlerts,
            (val) => themeProvider.updateNotificationSetting(
              ThemeProvider.perfKey,
              val,
            ),
          ),
          _buildSwitchItem(
            'leave_requests_notifications'.tr(),
            'get_leave_notifications'.tr(),
            themeProvider.leaveRequests,
            (val) => themeProvider.updateNotificationSetting(
              ThemeProvider.leaveKey,
              val,
            ),
          ),
          _buildSwitchItem(
            'new_hires_notifications'.tr(),
            'get_hire_notifications'.tr(),
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
            activeTrackColor: AppColors.primaryColor.withValues(alpha: 0.5),
          ),
        ],
      ),
    );
  }
}
