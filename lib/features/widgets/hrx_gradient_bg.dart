import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class HrxGradientBackground extends StatelessWidget {
  final Widget child;

  const HrxGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryColor,
            AppColors.darkSurfaceColor,
            AppColors.darkBackgroundColor,
          ],
          stops: [0.0, 0.6, 1.0],
        ),
      ),
      child: child,
    );
  }
}
