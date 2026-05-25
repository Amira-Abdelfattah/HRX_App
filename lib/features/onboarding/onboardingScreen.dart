import 'package:flutter/material.dart';
import 'package:hrx_app/features/auth/register.dart';
import 'package:hrx_app/features/widgets/hrx_gradient_bg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import 'onboarding_footer.dart';
import 'onboarding_model.dart';
import 'onboarding_page_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HrxGradientBackground(
        child: IntroductionScreen(

          rawPages: onboardingPages.map((page) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: OnboardingPageContent(pageModel: page),
            );
          }).toList(),

          showSkipButton: true,
          skip: Text('Skip', style: AppStyles.medium14Grey()),
          onSkip: () => _navigateToRegister(context),
          next: const Icon(Icons.arrow_forward,
              color: AppColors.secondaryColor),

          done: const SizedBox.shrink(),
          onDone: () => _navigateToRegister(context),
          showDoneButton: false,

          dotsDecorator: DotsDecorator(
            size: const Size.square(8.0),
            activeSize: const Size(24.0, 8.0),
            activeColor: AppColors.secondaryColor,
            color: AppColors.borderColor,
            spacing: const EdgeInsets.symmetric(horizontal: 4.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),


          globalFooter: OnboardingFooter(
            onDemoRequested: () => _navigateToRegister(context),
            onQuoteRequested: () => _navigateToRegister(context),
          ),

          controlsPadding: const EdgeInsets.symmetric(
              horizontal: 24.0, vertical: 8.0),
        ),
      ),
    );
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }
}
