import 'package:easy_localization/easy_localization.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> get onboardingPages => [
  OnboardingModel(
    imagePath: 'assets/images/onboarding1.png',
    title: 'onboarding_title_1'.tr(),
    description: 'onboarding_desc_1'.tr(),
  ),
  OnboardingModel(
    imagePath: 'assets/images/onboarding2.png',
    title: 'onboarding_title_2'.tr(),
    description: 'onboarding_desc_2'.tr(),
  ),
  OnboardingModel(
    imagePath: 'assets/images/onboarding3.png',
    title: 'onboarding_title_3'.tr(),
    description: 'onboarding_desc_3'.tr(),
  ),
];
