import 'package:ecomerceapp/models/Category.dart';
import 'package:ecomerceapp/screens/CategoriesScreen.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/IndexProvider.dart';
import '../screens/DetailsScreen.dart';
import '../screens/HomeScreen.dart';

class ScrollWidget extends StatelessWidget {
  final List<Category> children;
  ScrollWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    return ListView.builder(
      padding: EdgeInsets.only(left: 0.sp,right:0.sp,top: 5.sp),
        itemCount: children.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap:(){
             categoriesScreen.currentState!
                    .popUntil((route) => route.isFirst);
                indexProvider.setCurrentIndex(1);
            },
            child: ImageCard(image: children[index].image,title: children[index].name,));
        });
  }
}
