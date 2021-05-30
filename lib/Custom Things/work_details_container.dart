import 'package:flutter/material.dart';

class WorkDetailsContainer extends StatelessWidget {
  final String title;
  final String tagLine;
  final String desc;
  const WorkDetailsContainer({
    Key? key,
    required this.title,
    required this.tagLine,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  tagLine,
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
                  desc,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
