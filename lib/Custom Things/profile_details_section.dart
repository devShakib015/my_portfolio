import 'package:flutter/material.dart';
import 'package:my_portfolio/Models/launch_url.dart';
import 'package:my_portfolio/Models/my_strings.dart';

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
            MyStrings.myName,
            style: TextStyle(
              fontSize: 40,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            MyStrings.myTagLine,
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
            MyStrings.myDescription,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(16)),
              backgroundColor: MaterialStateProperty.all(
                Colors.black54,
              ),
            ),
            onPressed: () async {
              await MyUrl.launchURL(MyStrings.myResume);
            },
            child: Text(
              "My Resume",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
