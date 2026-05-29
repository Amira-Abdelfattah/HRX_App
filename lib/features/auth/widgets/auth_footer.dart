import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class AuthFooter extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onTap;

  const AuthFooter({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: AppStyles.regular14Grey().copyWith(
            color: AppColors.accentColor.withOpacity(0.7),
            fontSize: 14.sp,
          ),
          children: [
            TextSpan(text: text),
            TextSpan(
              text: linkText,
              recognizer: TapGestureRecognizer()..onTap = onTap,
              style: AppStyles.semi14PrimaryDark().copyWith(
                color: AppColors.accentColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
