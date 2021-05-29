import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomStrings {
  CustomStrings._();

  static final List<String> keywords = ["Design", "Develop", "Debug", "Deploy"];

  static final String headLine = "Howdy, It's Shakib";
  static final String tagLine = " Welcome to my territory!";

  static final List<String> homePageMainContents = [
    "Hi",
    "Are you looking for a Flutter Developer?",
    "Then you are at the right place",
    "Look around and explore",
    "You will like me, I guess!",
    "If you don't, thanks for visiting me!"
  ];

  static final String myName = "Hossain K M Shahriar";
  static final String myTagLine = "Software Engineer, YZU 2021";
  static final String myDescription =
      "Et aute est sunt dolore nostrud. Et dolore voluptate occaecat ut commodo laboris ullamco est esse ad. Dolor aute veniam reprehenderit nulla et eu consequat do nisi elit ipsum veniam ad. Irure ad duis occaecat amet laborum irure.\n\nEt aute est sunt dolore nostrud. Et dolore voluptate occaecat ut commodo laboris ullamco est esse ad. Dolor aute veniam reprehenderit nulla et eu consequat do nisi elit ipsum veniam ad. Irure ad duis occaecat amet laborum irure.";
  static final String myMail = "devshakib015@gmail.com";
  static final String myPhone = "+8801710265421";
  static final String myMessenger = "venomShakib";
  static final String myFacebook = "venomShakib";
  static final String myWhatsApp = "+8801710265421";
  static final String myWechat = "venomshakib";
  static final String myGithub = "devShakib015";
  static final String myResume =
      "https://docs.google.com/document/d/1H_hMzZQXB9ZEfFmNQ7mrfdVOwSfUckmwnoJfaOsXvJQ/edit?usp=sharing";

  static final List<Map<String, dynamic>> contactButtons = [
    {
      "icon": CupertinoIcons.mail_solid,
      "url": "mailto:${CustomStrings.myMail}",
      "tooltip": CustomStrings.myMail,
    },
    {
      "icon": CupertinoIcons.phone_fill,
      "url": "tel:${CustomStrings.myPhone}",
      "tooltip": CustomStrings.myPhone,
    },
    {
      "icon": FontAwesomeIcons.facebookMessenger,
      "url": "https://m.me/${CustomStrings.myMessenger}/",
      "tooltip": CustomStrings.myMessenger,
    },
    {
      "icon": FontAwesomeIcons.whatsappSquare,
      "url": "https://api.whatsapp.com/send?phone=${CustomStrings.myWhatsApp}",
      "tooltip": CustomStrings.myWhatsApp,
    },
    {
      "icon": FontAwesomeIcons.weixin,
      "url": "https://weixin://contacts/profile/{${CustomStrings.myWhatsApp}}",
      "tooltip": CustomStrings.myWechat,
    },
    {
      "icon": FontAwesomeIcons.facebookF,
      "url": "https://facebook.com/${CustomStrings.myFacebook}",
      "tooltip": CustomStrings.myFacebook,
    },
    {
      "icon": FontAwesomeIcons.github,
      "url": "https://github.com/${CustomStrings.myGithub}",
      "tooltip": CustomStrings.myGithub,
    }
  ];
}
