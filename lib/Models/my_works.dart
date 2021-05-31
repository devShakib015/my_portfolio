import 'package:my_portfolio/Models/my_images.dart';
import 'package:my_portfolio/Models/my_strings.dart';
import 'package:my_portfolio/Models/work.dart';

class MyWorks {
  MyWorks._();

  static final List<Work> all = [
    //Quaksha App
    for (var i = 0; i < MyImages.quaksha.length; i++)
      Work(
        title: "Online Educational Platform",
        tagline: "Built using API Integration [REST API]",
        desc: MyStrings.loremPara,
        image: MyImages.quaksha[i],
      ),

    //Ecommerce App
    for (var i = 0; i < MyImages.ecommerce.length; i++)
      Work(
        title: "E-Commerce App",
        tagline:
            "Fully Functional app backed by Firebase [Authentication, Firestore and Storage]",
        desc: MyStrings.loremPara,
        image: MyImages.ecommerce[i],
      ),

    //Coin Tracker App
    for (var i = 0; i < MyImages.bmi.length; i++)
      Work(
        title: "BMI Calculator",
        tagline: "Simple app design got from Dribble",
        desc: MyStrings.loremPara,
        image: MyImages.bmi[i],
      ),

    //Coin Tracker App
    for (var i = 0; i < MyImages.coin.length; i++)
      Work(
        title: "Coin Tracker",
        tagline: "Simple app design came out of my mind",
        desc: MyStrings.loremPara,
        image: MyImages.coin[i],
      ),

    //WB
    for (var i = 0; i < MyImages.wb.length; i++)
      Work(
        title: "Online Earning App",
        tagline: "A Big project backed by Firebase",
        desc: MyStrings.loremPara,
        image: MyImages.wb[i],
      ),

    //WB
    for (var i = 0; i < MyImages.msw.length; i++)
      Work(
        title: "Movie and Series Wiki",
        tagline: "Simple App to get Media Infos using API integration",
        desc: MyStrings.loremPara,
        image: MyImages.msw[i],
      ),
  ];
}
