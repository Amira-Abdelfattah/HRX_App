class OnboardingModel {
  final String imagePath;
  final String title;
  final String highlightWord;
  final String description;

  const OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.highlightWord,
    required this.description,
  });
}

const List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    imagePath: 'assets/images/onboarding1.png',
    title: 'HR Software That\nWorks for ',
    highlightWord: 'You.',
    description: 'Smart HR Solutions for Companies\nin the Middle East.',
  ),
  OnboardingModel(
    imagePath: 'assets/images/onboarding2.png',
    title: 'Your Corporate Identity\n& Data is ',
    highlightWord: 'Secure.',
    description:
        'Fully localized HR system tailored specifically\nto MENA labor laws with maximum privacy.',
  ),
  OnboardingModel(
    imagePath: 'assets/images/onboarding3.png',
    title: 'Empower Your Team\nWith Continuous ',
    highlightWord: 'Support.',
    description:
        'Amazing after-sales support with no credit card required to start your journey.',
  ),
];
