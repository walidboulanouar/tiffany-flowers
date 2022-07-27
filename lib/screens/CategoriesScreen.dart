import 'package:ecomerceapp/widgets/CategoryAppBar.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../models/Category.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;
  CategoriesScreen({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){},child: Icon(Icons.whatsapp,size: 35.sp,),),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CategoryAppBar(),
          SizedBox(
            height: 2.h,
          ),
          Flexible(
            child: GridView.builder(
                padding: EdgeInsets.all(0),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    // childAspectRatio: 3 / 2,
                    crossAxisSpacing: 1.sp,
                    mainAxisSpacing: 5.sp),
                itemCount: categories.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    
                      child: ImageCard(
                          image: categories[index].image,
                          title: categories[index].title));
                }),
          ),
        ],
      ),
    );
  }
}
