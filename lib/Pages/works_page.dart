import 'package:flutter/material.dart';
import 'package:my_portfolio/Custom%20Things/work_layout.dart';
import 'package:my_portfolio/Models/my_works.dart';
import 'package:my_portfolio/Models/responsive_size.dart';

class WorksPage extends StatefulWidget {
  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  int _itemCount = MyWorks.all.length;
  int _currentWork = 1;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        PageView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: _itemCount,
          itemBuilder: (context, index) {
            return WorkLayout(
              width: _width,
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
          bottom: _width >= ResponsiveSize.normalWidth
              ? 50
              : _width >= ResponsiveSize.mobileWidth
                  ? 30
                  : 10,
          right: _width >= ResponsiveSize.normalWidth
              ? 150
              : _width >= ResponsiveSize.mobileWidth
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
