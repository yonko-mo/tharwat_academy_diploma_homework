class OnboardingItemModel {
  final String image;
  final String title;
  final String description;
  final double? imageToTitleSpacing;
  final double? imageTopSpacing;

  const OnboardingItemModel({
    required this.image,
    required this.title,
    required this.description,
    this.imageToTitleSpacing,
    this.imageTopSpacing,
  });
}
