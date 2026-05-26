import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  Color? backgroundColor;
  Widget? prefixIconButton;
  String text;
  TextStyle? textStyle;
  Function onButtonClicked;

  CustomElevatedButton({
    required this.text,
    this.textStyle,
    required this.onButtonClicked,
    this.prefixIconButton,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () {
        onButtonClicked();
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: width * .04,
          vertical: height * .02,
        ),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixIconButton ?? SizedBox(),
          SizedBox(width: width * .02),
          Text(text, style: textStyle ?? AppStyles.medium20White),
        ],
      ),
    );
  }
}
