import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../models/Category.dart';
import '../widgets/CarouselImage.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/ScrollWidget.dart';
import '../widgets/TextTitle.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomAppBar(),
        Flexible(
          child: ListView(padding: EdgeInsets.zero, children: [
            CarouselImage(),
            TextTitle(
              title: "Categories",
            ),
            Container(
              height: 24.h,
              child: ScrollWidget(children: [
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
              ]),
            ),
            Center(
                child: Text("View All",
                    style:
                        TextStyle(fontSize: 7.sp, color: Color(0xffB5B5B5)))),
            TextTitle(
              title: "New Items",
            ),
            Container(
              height: 19.h,
              child: ScrollWidget(children: [
                Category(image: "assets/images/bouket.jpg"),
                Category(image: "assets/images/bouket.jpg"),
                Category(image: "assets/images/bouket.jpg"),
                Category(image: "assets/images/bouket.jpg"),
              ]),
            ),
            TextTitle(
              title: "Mostview Products",
            ),
            Container(
              height: 19.h,
              child: ScrollWidget(children: [
                Category(image: "assets/images/bouket.jpg"),
                Category(image: "assets/images/bouket.jpg"),
                Category(image: "assets/images/bouket.jpg"),
                Category(image: "assets/images/bouket.jpg"),
              ]),
            ),
          ]),
        ),
      ],
    );
  }
}
