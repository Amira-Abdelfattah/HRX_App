import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../widgets/custom_elevated_button.dart';

class OnboardingFooter extends StatelessWidget {
  final VoidCallback onDemoRequested;
  final VoidCallback onQuoteRequested;

  const OnboardingFooter({
    super.key,
    required this.onDemoRequested,
    required this.onQuoteRequested,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            text: 'Request Demo',
            backgroundColor: AppColors.secondaryColor,
            textStyle: AppStyles.semi16White,
            onButtonClicked: onDemoRequested,
          ),
          const SizedBox(height: 12),
          CustomElevatedButton(
            text: 'Get Price Quote',
            backgroundColor: AppColors.whiteColor,
            textStyle: AppStyles.medium16PrimaryDarkText(),
            onButtonClicked: onQuoteRequested,
          ),
        ],
      ),
    );
  }
}
