import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/theme_provider.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'setting_section_card.dart';

class LanguageSettingsSection extends StatefulWidget {
  const LanguageSettingsSection({super.key});

  @override
  State<LanguageSettingsSection> createState() =>
      _LanguageSettingsSectionState();
}

class _LanguageSettingsSectionState extends State<LanguageSettingsSection> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themeProvider = context.watch<ThemeProvider>();
    final selectedLanguage = themeProvider.language;

    return SettingSectionCard(
      title: 'Language',
      subtitle: 'Select your language',
      icon: Icons.language_outlined,
      iconColor: Colors.teal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurfaceLightColor
                  : AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.borderColor.withValues(alpha: 0.3),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedLanguage,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: isDark
                    ? AppColors.darkSurfaceColor
                    : AppColors.whiteColor,
                items: ['English (US)', 'Arabic', 'French', 'Spanish'].map((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: AppStyles.medium14PrimaryDark()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    context.read<ThemeProvider>().setLanguage(newValue);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
