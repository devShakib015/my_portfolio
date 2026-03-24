class Skill {
  final String title;
  final String image;
  final double progress;
  final String category;

  const Skill({
    required this.title,
    required this.image,
    required this.progress,
    this.category = 'Other',
  });
}
