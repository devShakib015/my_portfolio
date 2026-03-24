import 'package:flutter/material.dart';
import 'package:my_portfolio/custom/work_layout.dart';
import 'package:my_portfolio/models/my_works.dart';
import 'package:my_portfolio/models/responsive_size.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  final int _itemCount = MyWorks.all.length;
  int _currentWork = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        PageView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: _itemCount,
          itemBuilder: (context, index) {
            return WorkLayout(
              width: width,
              desc: MyWorks.all[index].desc,
              tagline: MyWorks.all[index].tagline,
              image: MyWorks.all[index].image,
              title: MyWorks.all[index].title,
            );
          },
          onPageChanged: (index) {
            setState(() {
              _currentWork = index + 1;
            });
          },
        ),
        Positioned(
          bottom: width >= ResponsiveSize.normalWidth
              ? 50
              : width >= ResponsiveSize.mobileWidth
                  ? 30
                  : 10,
          right: width >= ResponsiveSize.normalWidth
              ? 150
              : width >= ResponsiveSize.mobileWidth
                  ? 80
                  : 20,
          child: Card(
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text("$_currentWork / $_itemCount"),
              )),
        ),
      ],
    );
  }
}
