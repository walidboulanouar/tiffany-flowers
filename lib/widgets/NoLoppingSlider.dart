import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:flutter/material.dart';



class NoLoopingSlider extends StatelessWidget {
  List<String> imgList;
  
  // final List<Widget> imageSliders = imgList
  //     .map((item) => Container(
  //           child: ImageCard(image: item)
  //         ))
  //     .toList();

  NoLoopingSlider({Key? key,required this.imgList}) : super(key: key);
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
        items: imgList
      .map((item) => Container(
            child: ImageCard(image: item)
          ))
      .toList(),
      )
    );
  }
}
