import 'package:ecomerceapp/models/Category.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ScrollWidget extends StatelessWidget {
  final List<Category> children;
  ScrollWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 8.sp,right:8.sp,top: 5.sp),
        itemCount: children.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return ImageCard(image: children[index].image,title: children[index].name,);
        });
  }
}
