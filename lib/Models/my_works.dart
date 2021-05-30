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
        tagline: "Complete app building from REST API",
        desc: MyStrings.loremPara,
        image: MyImages.quaksha[i],
      ),

    //Ecommerce App
    for (var i = 0; i < MyImages.ecommerce.length; i++)
      Work(
        title: "E-Commerce App",
        tagline: "Fully Functional App with Cloud Firestore",
        desc: MyStrings.loremPara,
        image: MyImages.ecommerce[i],
      ),

    //Coin Tracker App
    for (var i = 0; i < MyImages.bmi.length; i++)
      Work(
        title: "BMI Calculator",
        tagline: "Simple App Design",
        desc: MyStrings.loremPara,
        image: MyImages.bmi[i],
      ),

    //Coin Tracker App
    for (var i = 0; i < MyImages.coin.length; i++)
      Work(
        title: "Coin Tracker",
        tagline: "Simple App Design",
        desc: MyStrings.loremPara,
        image: MyImages.coin[i],
      ),

    //WB
    for (var i = 0; i < MyImages.wb.length; i++)
      Work(
        title: "Online Earning App",
        tagline: "Fully Functional App with Cloud Firestore",
        desc: MyStrings.loremPara,
        image: MyImages.wb[i],
      ),

    //WB
    for (var i = 0; i < MyImages.msw.length; i++)
      Work(
        title: "Movie and Series Wiki",
        tagline: "Simple App to get Media Infos",
        desc: MyStrings.loremPara,
        image: MyImages.msw[i],
      ),
  ];
}
