import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyStrings {
  MyStrings._();

  static final List<String> keywords = ["Design", "Develop", "Debug", "Deploy"];

  static final String headLine = "Howdy, It's Shakib";
  static final String tagLine = "Welcome to my territory!";

  static final List<String> homePageMainContents = [
    "Hi",
    "Are you looking for the best Flutter Developer?",
    "Then you are at the right place",
    "Look around and explore",
    "I am sure you will find me interesting",
    "If you don't, thanks for visiting me!"
  ];

  static final String myName = "Hossain K M Shahriar";
  static final String myTagLine = "CTO & Co-founder · Flutter · Cloud · AI";
  static final String myDescription = '''
Over six years of shipping production software have taken me from writing my first Python scripts to leading enterprise-scale engineering teams as a CTO. Flutter became my primary craft early on, and today I engineer full-stack, cloud-native systems at the intersection of mobile, AI, and infrastructure.

Flutter & Firebase are the core of my craft. I've built and launched a dozen production apps — from real-time fintech dashboards to social platforms — architecting everything from Firestore data models and Firebase ML pipelines to push notifications and in-app monetization. When the backend needs more muscle, I design REST APIs and GraphQL services that integrate cleanly with any client.

Cloud & DevOps are where modern engineering happens. I run production workloads on both Google Cloud Platform and AWS, containerize with Docker, orchestrate with Kubernetes, and build zero-downtime CI/CD pipelines that cut deploy cycles from days to minutes. Automated testing suites and robust monitoring are non-negotiables in everything I ship.

AI integration is now part of every product I build. I embed machine learning into mobile and web experiences — from on-device inference to LLM-powered features — and leverage Firebase ML and cloud AI services to deliver intelligent, context-aware applications that stand apart.

As CTO and Co-founder of Shpper, a Dubai-based tech startup, I lead a distributed team of 20+ engineers across multiple time zones. I drive technical vision, enforce architecture standards, manage enterprise delivery roadmaps, and mentor the next generation of developers. The best engineers are also great communicators and leaders — and I strive to be both.
''';
  static final String myMail = "devshakib015@gmail.com";
  static final String myPhone = "+8801710265421";
  static final String myMessenger = "venomShakib";
  static final String myFacebook = "venomShakib";
  static final String myWhatsApp = "+8801710265421";
  static final String myWechat = "venomshakib";
  static final String myGithub = "devShakib015";

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
      "icon": FontAwesomeIcons.squareWhatsapp,
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
