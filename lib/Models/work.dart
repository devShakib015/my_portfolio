class Work {
  final String title;
  final String category;
  final String tagline;
  final String desc;
  final List<String> screenshots;
  final List<String> tags;
  final String? playStoreUrl;
  final String? githubUrl;
  final String? liveUrl;

  const Work({
    required this.title,
    this.category = 'Mobile App',
    required this.tagline,
    required this.desc,
    required this.screenshots,
    this.tags = const [],
    this.playStoreUrl,
    this.githubUrl,
    this.liveUrl,
  });

  /// Backward-compatible getter so old views still compile without changes.
  String get image => screenshots.isNotEmpty ? screenshots.first : '';
  String get coverImage => image;
}
