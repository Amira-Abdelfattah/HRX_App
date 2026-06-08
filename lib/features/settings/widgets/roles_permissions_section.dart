import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'setting_section_card.dart';

class RolesPermissionsSection extends StatelessWidget {
  const RolesPermissionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingSectionCard(
      title: 'Roles & Permissions',
      subtitle: 'Manage user access levels',
      icon: Icons.shield_outlined,
      iconColor: Colors.indigo,
      child: Column(
        children: [
          _buildRoleItem('Admin'),
          _buildRoleItem('HR Manager'),
          _buildRoleItem('Manager'),
          _buildRoleItem('Employee'),
        ],
      ),
    );
  }

  Widget _buildRoleItem(String roleName) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.people_outline,
            size: 20.sp,
            color: AppColors.textMutedColor,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(roleName, style: AppStyles.medium14PrimaryDark()),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: AppStyles.medium14PrimaryDark(
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
