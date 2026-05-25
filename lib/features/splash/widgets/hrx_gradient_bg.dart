import 'package:flutter/cupertino.dart';
import 'package:hrx_app/core/utils/app_colors.dart';

class HrxGradientBackground extends StatelessWidget {
  final Widget child;

  const HrxGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.surfaceColor,
            Color(0xffEEF3FC),
            AppColors.whiteColor,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
