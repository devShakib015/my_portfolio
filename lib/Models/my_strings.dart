import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyStrings {
  MyStrings._();

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
  static final String myTagLine = "Software Engineer, YZU-CHINA, 2021";
  static final String myDescription =
      "It’s the time when I can believe in myself. After all these years of learning and practicing now I feel that I can do professional and serious jobs.\nI was so upset at a time when I wasn't able to figure out what I do and what’s my ability. But struggling and working hard gave me confidence.\nI’m a Flutter developer. I was developing things using flutter for almost a year. Before this I was busy working with python and the frameworks of it. For my graduation project I was looking for a way to build it and I found Flutter. Which changes my developing career completely. I just love coding Flutter. It’s beautiful, versatile and it’s a super power.\nI’m fully ready for the interview as a flutter developer.";
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
      "url": "mailto:${MyStrings.myMail}",
      "tooltip": MyStrings.myMail,
    },
    {
      "icon": CupertinoIcons.phone_fill,
      "url": "tel:${MyStrings.myPhone}",
      "tooltip": MyStrings.myPhone,
    },
    {
      "icon": FontAwesomeIcons.facebookMessenger,
      "url": "https://m.me/${MyStrings.myMessenger}/",
      "tooltip": MyStrings.myMessenger,
    },
    {
      "icon": FontAwesomeIcons.whatsappSquare,
      "url": "https://api.whatsapp.com/send?phone=${MyStrings.myWhatsApp}",
      "tooltip": MyStrings.myWhatsApp,
    },
    {
      "icon": FontAwesomeIcons.weixin,
      "url": "https://weixin://contacts/profile/{${MyStrings.myWhatsApp}}",
      "tooltip": MyStrings.myWechat,
    },
    {
      "icon": FontAwesomeIcons.facebookF,
      "url": "https://facebook.com/${MyStrings.myFacebook}",
      "tooltip": MyStrings.myFacebook,
    },
    {
      "icon": FontAwesomeIcons.github,
      "url": "https://github.com/${MyStrings.myGithub}",
      "tooltip": MyStrings.myGithub,
    }
  ];

  static final String loremPara =
      "Lorem labore amet eu ex aliquip ex fugiat. Fugiat enim et irure ullamco quis sint sint laborum adipisicing do tempor. Qui anim occaecat elit amet magna est. Ex proident culpa voluptate adipisicing amet duis. Lorem deserunt incididunt magna magna veniam aliquip Lorem. Elit minim nisi nisi proident nulla veniam commodo occaecat voluptate eiusmod non duis sint.";
}
