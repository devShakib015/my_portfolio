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
  static final String myTagLine = "Software Developer, YZU-CHINA, 2021";
  static final String myDescription = '''
After over six years in the software development industry, I can confidently say I’ve found my stride—both technically and creatively. My journey began with Python and its diverse ecosystem of frameworks, where I built data-driven applications and honed my backend expertise. However, everything changed when I discovered Flutter while exploring options for my graduation project. What started as a tool quickly became a passion—and eventually, my specialty.

Over the past few years, Flutter has transformed the way I approach product development. Its expressive UI capabilities, cross-platform flexibility, and developer-friendly architecture have empowered me to build scalable, high-performance apps with precision and speed. From designing pixel-perfect interfaces to architecting clean and maintainable codebases, I’ve developed a deep appreciation for the balance between frontend elegance and robust backend systems.

As the current CTO and co-founder of Shpper, a Dubai-based tech startup, I lead the technical vision and oversee the development of our core platform, leveraging Flutter as the foundation for our mobile experience. My role spans product strategy, code quality enforcement, team leadership, and long-term scalability planning. Prior to this, I was involved in multiple freelance and startup projects where I delivered full-stack solutions, mentored junior developers, and collaborated cross-functionally to bring complex ideas to life.

What sets me apart is not just my proficiency in Flutter or Python, but my mindset—an engineer’s curiosity combined with a founder’s resilience. The years of uncertainty and self-doubt I once faced have shaped me into a confident and adaptive professional who thrives in fast-paced, goal-driven environments.

Flutter is more than just a tool in my stack—it’s where I do my best work. And I’m always pushing to master it further, explore its depths, and build things that matter.
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
