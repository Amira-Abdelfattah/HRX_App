import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  final Color? filledColor;
  final Color? borderColor;
  final String hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool obSecureText;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.style,
    this.maxLines,
    this.filledColor,
    this.obSecureText = false,
    this.borderColor,
    this.readOnly,
    this.onTap,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(top: 12.h, bottom: 20.h),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly ?? false,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        focusNode: focusNode,
        maxLines: maxLines ?? 1,
        cursorColor: isDark ? AppColors.whiteColor : AppColors.blackColor,
        style: style ?? AppStyles.semi20Primary(),
        obscureText: obSecureText,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          filled: true,
          fillColor: filledColor ??
              (isDark ? AppColors.darkSurfaceLightColor : AppColors.whiteColor),
          hintText: hintText,
          labelText: labelText,
          labelStyle: labelStyle ?? AppStyles.regular14Grey(),
          hintStyle: hintStyle ?? AppStyles.medium14LightPrimary(),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: borderColor ??
                  (isDark ? AppColors.darkBorderColor : AppColors.borderColor),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.dangerColor, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.dangerColor, width: 2),
          ),
        ),
      ),
    );
  }
}
