import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? prefixIconButton;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onButtonClicked;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.textStyle,
    required this.onButtonClicked,
    this.prefixIconButton,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonClicked,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
        ),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIconButton != null) ...[
            prefixIconButton!,
            SizedBox(width: 8.w),
          ],
          Text(text, style: textStyle ?? AppStyles.semi16White),
        ],
      ),
    );
  }
}
