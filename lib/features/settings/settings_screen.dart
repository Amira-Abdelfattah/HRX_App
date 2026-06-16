import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_page_header.dart';
import 'widgets/company_info_section.dart';
import 'widgets/language_settings_section.dart';
import 'widgets/notification_settings_section.dart';
import 'widgets/roles_permissions_section.dart';
import 'widgets/theme_settings_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPageHeader(
                title: 'settings'.tr(),
                subtitle: 'settings_subtitle'.tr(),
              ),
              SizedBox(height: 24.h),
              Column(
                children: [
                  const CompanyInfoSection(),
                  SizedBox(height: 24.h),
                  const RolesPermissionsSection(),
                  SizedBox(height: 24.h),
                  const NotificationSettingsSection(),
                  SizedBox(height: 24.h),
                  const ThemeSettingsSection(),
                  SizedBox(height: 24.h),
                  const LanguageSettingsSection(),
                  SizedBox(height: 32.h),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      text: 'save_changes'.tr(),
                      onButtonClicked: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('settings_saved'.tr()),
                            backgroundColor: AppColors.primaryColor,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
