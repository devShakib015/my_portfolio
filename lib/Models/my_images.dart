final String _worksPath = "assets/images/works";

class MyImages {
  MyImages._();

  static final String myProfileImage = "assets/images/profile.jpg";
  static final String loveImage = "assets/images/love.png";

  static final List<String> bmi = [
    for (var i = 0; i < 2; i++) "$_worksPath/bmi${i + 1}.jpg",
  ];

  static final List<String> coin = [
    for (var i = 0; i < 2; i++) "$_worksPath/coin${i + 1}.jpg",
  ];

  static final List<String> ecommerce = [
    for (var i = 0; i < 9; i++) "$_worksPath/ecc${i + 1}.png",
  ];

  static final List<String> quaksha = [
    for (var i = 0; i < 9; i++) "$_worksPath/q${i + 1}.jpg",
  ];

  static final List<String> msw = [
    for (var i = 0; i < 2; i++) "$_worksPath/msw${i + 1}.jpg",
  ];

  static final List<String> wb = [
    for (var i = 0; i < 4; i++) "$_worksPath/wb${i + 1}.png",
  ];
}
