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

const List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    imagePath: 'assets/images/onboarding1.png',
    title: 'Manage your team efficiently.',
    description:
        'Keep track of attendance, payroll, and performance seamlessly in one place.',
  ),
  OnboardingModel(
    imagePath: 'assets/images/onboarding2.png',
    title: 'Smart HR Solutions for you.',
    description:
        'Leverage AI-driven insights to make informed decisions for your organization\'s growth and operational excellence.',
  ),
  OnboardingModel(
    imagePath: 'assets/images/onboarding3.png',
    title: 'Unified Management',
    description:
        'Connect recruitment, payroll, and analytics into a single, powerful mobile experience designed for speed and clarity.',
  ),
];
