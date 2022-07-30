import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "assets/images/bouket3.jfif",
  "assets/images/bouket3.jfif",
  "assets/images/bouket3.jfif",
  "assets/images/bouket3.jfif",
];

class NoLoopingSlider extends StatelessWidget {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: ImageCard(image: item)
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return  Container(
          child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.7,
          aspectRatio: 1.40,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: false,
        ),
        items: imageSliders,
      )
    );
  }
}
