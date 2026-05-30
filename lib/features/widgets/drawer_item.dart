import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected
            ? AppColors.accentColor
            : (isDark ? AppColors.darkTextBody : AppColors.textBodyColor),
      ),
      title: Text(
        title,
        style: isSelected
            ? AppStyles.medium16PrimaryDarkText(color: AppColors.accentColor)
            : AppStyles.regular16PrimaryDark(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.textPrimaryColor,
              ),
      ),
      selected: isSelected,
      selectedTileColor: AppColors.accentColor.withOpacity(0.1),
      onTap: onTap,
    );
  }
}
