import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final currentLocale = context.locale.languageCode;

    return SettingSectionCard(
      title: 'language'.tr(),
      subtitle: 'select_language'.tr(),
      icon: Icons.language_outlined,
      iconColor: Colors.teal,
      child: Column(
        children: [
          _buildLanguageOption(
            context,
            localeCode: 'en',
            title: 'english'.tr(),
            isSelected: currentLocale == 'en',
            flag: '🇺🇸',
          ),
          SizedBox(height: 12.h),
          _buildLanguageOption(
            context,
            localeCode: 'ar',
            title: 'arabic'.tr(),
            isSelected: currentLocale == 'ar',
            flag: '🇪🇬',
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, {
    required String localeCode,
    required String title,
    required bool isSelected,
    required String flag,
  }) {
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          context.setLocale(Locale(localeCode));
        }
      },
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
            Text(
              flag,
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: AppStyles.medium14PrimaryDark(context: context),
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
