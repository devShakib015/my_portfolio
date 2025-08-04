import 'package:url_launcher/url_launcher.dart';

class MyUrl {
  MyUrl._();

  static Future<void> launchURL(String url) async =>
      await canLaunchUrl(Uri.parse(url))
          ? await launchUrl(Uri.parse(url))
          : throw 'Could not launch $url';
}
