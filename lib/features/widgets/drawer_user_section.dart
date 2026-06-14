import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class DrawerUserSection extends StatelessWidget {
  final String userName;
  final String userRole;

  const DrawerUserSection({
    super.key,
    required this.userName,
    required this.userRole,
  });

  String _getUserInitials(String name) {
    if (name.isEmpty || name == 'User Name' || name == 'User') return 'JD';
    final parts = name.trim().split(' ');
    if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
      return (parts[0][0] + parts[1][0]).toUpperCase();
    }
    return name.substring(0, name.length >= 2 ? 2 : 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.borderLightColor,
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.accentColor,
            child: Text(
              _getUserInitials(userName),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userName,
                  style: AppStyles.medium14PrimaryDarkName(
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimaryColor,
                  ),
                ),
                Text(
                  userRole,
                  style: AppStyles.regular12PrimaryDarkRole(
                    color: isDark
                        ? AppColors.darkTextMuted
                        : AppColors.textMutedColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
