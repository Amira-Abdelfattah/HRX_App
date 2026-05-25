import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'onboarding_model.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingModel pageModel;

  const OnboardingPageContent({super.key, required this.pageModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: pageModel.title,
                style: AppStyles.semi24PrimaryDark().copyWith(
                  fontSize: 30,
                  height: 1.3,
                ),
              ),
              TextSpan(
                text: pageModel.highlightWord,
                style: AppStyles.semi24PrimaryDark().copyWith(
                  fontSize: 30,
                  color: AppColors.accentDarkColor,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          pageModel.description,
          textAlign: TextAlign.center,
          style: AppStyles.regular14Grey().copyWith(
            color: AppColors.textBodyColor.withOpacity(0.85),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
