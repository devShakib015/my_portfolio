class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;
  static const double sectionV = 100;

  static double pageH(double width) {
    if (width >= 1600) return 220;
    if (width >= 1200) return 160;
    if (width >= 900) return 80;
    if (width >= 600) return 40;
    return 24;
  }
}
