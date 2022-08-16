import 'package:ecomerceapp/models/Category.dart';
import 'package:ecomerceapp/screens/CategoryDetailsScreen.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/Product.dart';
import '../providers/IndexProvider.dart';
import '../screens/DetailsScreen.dart';
import '../screens/HomeScreen.dart';

class ProductScrollWidget extends StatelessWidget {
  final List<Product> children;
  ProductScrollWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    return ListView.builder(
        padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 5.sp),
        itemCount: children.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return InkWell(
              onTap: children[index].categories!.isNotEmpty?() {
                categoriesScreen.currentState!
                    .popUntil((route) => route.isFirst);
                categoriesScreen.currentState!.push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => (CategoryDetailsScreen(
                      catId: children[index].categories![0].id,
                      name: children[index].categories![0].name,
                    )),
                  ),
                );
                indexProvider.setCurrentIndex(1);
              }:null,
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: ImageCard(
                    image: children[index].images[0],
                    title: children[index].name,
                  )));
        });
  }
}
