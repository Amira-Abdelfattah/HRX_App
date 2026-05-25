import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/core/utils/app_colors.dart';
import 'package:hrx_app/core/utils/app_styles.dart';

class HrxLogo extends StatelessWidget {
  final double fontSize;

  const HrxLogo({super.key, this.fontSize = 36});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Performix",
          style: AppStyles.bold32PrimaryDark().copyWith(
            fontSize: fontSize.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.5,
            color: AppColors.primaryColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (fontSize * .33).w),
          child: Text(
            "|",
            style: AppStyles.light18HintText().copyWith(
              color: AppColors.primaryColor.withOpacity(0.3),
              fontSize: (fontSize * .88).sp,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "HR",
              style: AppStyles.bold32PrimaryDark().copyWith(
                fontSize: fontSize.sp,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              "X",
              style: AppStyles.bold32PrimaryDark().copyWith(
                fontSize: fontSize.sp,
                color: AppColors.accentColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
