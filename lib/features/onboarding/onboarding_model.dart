class OnboardingModel {
  final String title;
  final String highlightWord;
  final String description;

  const OnboardingModel({
    required this.title,
    required this.highlightWord,
    required this.description,
  });
}

const List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    title: 'HR Software That\nWorks for ',
    highlightWord: 'You.',
    description: 'Smart HR Solutions for Companies\nin the Middle East.',
  ),
  OnboardingModel(
    title: 'Your Corporate Identity\n& Data is ',
    highlightWord: 'Secure.',
    description:
        'Fully localized HR system tailored specifically\nto MENA labor laws with maximum privacy.',
  ),
  OnboardingModel(
    title: 'Empower Your Team\nWith Continuous ',
    highlightWord: 'Support.',
    description:
        'Amazing after-sales support with no credit card required to start your journey.',
  ),
];
