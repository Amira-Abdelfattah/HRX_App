import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/theme_provider.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'setting_section_card.dart';

class ThemeSettingsSection extends StatelessWidget {
  const ThemeSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentMode = themeProvider.themeMode;

    return SettingSectionCard(
      title: 'theme'.tr(),
      subtitle: 'choose_appearance'.tr(),
      icon: Icons.palette_outlined,
      iconColor: Colors.pinkAccent,
      child: Column(
        children: [
          _buildThemeOption(
            context,
            id: ThemeMode.light,
            title: 'light_mode'.tr(),
            subtitle: 'classic_bright_theme'.tr(),
            icon: Icons.wb_sunny_outlined,
            isSelected:
                currentMode == ThemeMode.light ||
                (currentMode == ThemeMode.system && !themeProvider.isDarkMode),
          ),
          SizedBox(height: 12.h),
          _buildThemeOption(
            context,
            id: ThemeMode.dark,
            title: 'dark_mode'.tr(),
            subtitle: 'easy_on_eyes'.tr(),
            icon: Icons.nightlight_round_outlined,
            isSelected:
                currentMode == ThemeMode.dark ||
                (currentMode == ThemeMode.system && themeProvider.isDarkMode),
          ),
          SizedBox(height: 12.h),
          _buildThemeOption(
            context,
            id: ThemeMode.system,
            title: 'system_default'.tr(),
            subtitle: 'use_device_settings'.tr(),
            icon: Icons.settings_brightness_outlined,
            isSelected: currentMode == ThemeMode.system,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context, {
    required ThemeMode id,
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => themeProvider.setThemeMode(id),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkSurfaceLightColor
              : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.textMutedColor,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: AppStyles.medium14PrimaryDark(context: context)),
                  Text(subtitle,
                      style: AppStyles.regular12Grey(context: context)),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.primaryColor,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }
}
