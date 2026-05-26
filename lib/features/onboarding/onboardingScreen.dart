import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrx_app/features/auth/register.dart';
import 'package:hrx_app/features/widgets/hrx_gradient_bg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../core/utils/app_colors.dart';
import 'onboarding_footer.dart';
import 'onboarding_header.dart';
import 'onboarding_model.dart';
import 'onboarding_page_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int _currentIndex = 0;

  void _navigateToRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HrxGradientBackground(
        child: SafeArea(
          child: IntroductionScreen(
            key: introKey,
            rawPages: onboardingPages.map((page) {
              return OnboardingPageContent(pageModel: page);
            }).toList(),
            onDone: _navigateToRegister,
            showDoneButton: false,
            showNextButton: false,
            showBackButton: false,
            showSkipButton: false,
            onChange: (index) => setState(() => _currentIndex = index),
            dotsDecorator: DotsDecorator(
              size: Size.square(8.0.r),
              activeSize: Size(24.0.w, 8.0.h),
              activeColor: AppColors.accentColor,
              color: AppColors.borderColor,
              spacing: EdgeInsets.symmetric(horizontal: 4.0.w),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0.r),
              ),
            ),
            globalHeader: OnboardingHeader(
              onBack: () {
                if (_currentIndex > 0) {
                  introKey.currentState?.animateScroll(_currentIndex - 1);
                } else {
                  Navigator.maybePop(context);
                }
              },
              onSkip: _navigateToRegister,
            ),
            globalFooter: OnboardingFooter(
              isLastPage: _currentIndex == onboardingPages.length - 1,
              onPressed: () {
                if (_currentIndex == onboardingPages.length - 1) {
                  _navigateToRegister();
                } else {
                  introKey.currentState?.next();
                }
              },
            ),
            controlsPadding: EdgeInsets.only(bottom: 110.h),
            dotsContainerDecorator: const BoxDecoration(
                color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
