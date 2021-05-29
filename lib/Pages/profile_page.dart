import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Custom%20Things/custom_strings.dart';
import 'package:my_portfolio/Custom%20Things/launch_url.dart';
import 'package:my_portfolio/Custom%20Things/my_images.dart';
import 'package:my_portfolio/Custom%20Things/responsive_size.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _responsivePadding = _width >= ResponsiveSize.mobileWidth ? 50 : 15;

    List<Map<String, dynamic>> _contactButtons = [
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
        "url":
            "https://api.whatsapp.com/send?phone=${CustomStrings.myWhatsApp}",
        "tooltip": CustomStrings.myWhatsApp,
      },
      {
        "icon": FontAwesomeIcons.weixin,
        "url":
            "https://weixin://contacts/profile/{${CustomStrings.myWhatsApp}}",
        "tooltip": CustomStrings.myWechat,
      }
    ];

    return Container(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: _responsivePadding, vertical: 20),
        child: _width >= ResponsiveSize.tabWidth
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                        child: ProfileDetailsSection(
                            contactButtons: _contactButtons)),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ProfileImageSection(),
                    ),
                  )
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 400,
                        child: ProfileImageSection()),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileDetailsSection(contactButtons: _contactButtons),
                  ],
                ),
              ),
      ),
    );
  }
}

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        MyImages.profileImage,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({
    Key? key,
    required List<Map<String, dynamic>> contactButtons,
  })  : _contactButtons = contactButtons,
        super(key: key);

  final List<Map<String, dynamic>> _contactButtons;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            CustomStrings.myName,
            style: TextStyle(
              fontSize: 40,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            CustomStrings.myTagLine,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            CustomStrings.myDescription,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: _contactButtons
                .map(
                  (button) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      onPressed: () async {
                        await MyUrl.launchURL(button["url"]);
                      },
                      color: Colors.black87,
                      icon: Icon(
                        button["icon"],
                      ),
                      tooltip: button["tooltip"],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
