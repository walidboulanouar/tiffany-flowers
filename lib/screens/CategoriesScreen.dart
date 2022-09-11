import 'package:ecomerceapp/providers/CategoriesProvider.dart';
import 'package:ecomerceapp/screens/CategoryDetailsScreen.dart';
import 'package:ecomerceapp/screens/MainScreen.dart';
import 'package:ecomerceapp/widgets/CategoryAppBar.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import '../models/Category.dart';
import '../providers/IndexProvider.dart';
import '../services/Services.dart';
import 'HomeScreen.dart';

class CategoriesScreen extends StatefulWidget {
  // final List<Category> categories;
  final GlobalKey<NavigatorState> categoriesScreen;
  CategoriesScreen(
      {Key? key,required this.categoriesScreen})
      : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  
  
  
  @override
  Widget build(BuildContext context) {
     CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context);
    
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    
    
    // if(this.mounted){
    //   getCategories(categoriesProvider);
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        height: 6.h,
        width: 6.h,
        child: FloatingActionButton(
          heroTag: Text("btn2"),
          backgroundColor: Colors.green,
          onPressed: () {
            openWhatsap();
          },
          child: Icon(
            Icons.whatsapp,
            size: 25.sp,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CategoryAppBar(
            myfc: () {
              indexProvider.setCurrentIndex(2);
              // widget.categoriesScreen.currentState!.setState(() {
                
              // });
              
              // restorablePush(
              //   (context, arguments) => MaterialPageRoute(
              //     builder: (context) => HomeScreen(),
              //   ),
              // );

              // Navigator.of(context).pushReplacement(MaterialPageRoute(

              // builder: (context) => MainScreen()));
            },
            title: "Categories",
          ),
          SizedBox(
            height: 2.h,
          ),
          Flexible(
            child: GridView.builder(
                padding: EdgeInsets.only(top: 0,bottom: 40.sp),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 170,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 1.sp,
                    mainAxisSpacing: 10.sp),
                itemCount: categoriesProvider.categories.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {    
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              (CategoryDetailsScreen(
                              catId: categoriesProvider.categories[index].id,
                            name: categoriesProvider.categories[index].name.toString(),
                          )),
                        ),
                      );

                      // Navigator.of(context).pushNamed('/categorydetails');
                      // _categoriesScreen.currentState?.pushNamed('/categorydetails');
                      // changeWidget(CategoryDetailsScreen(categories: []), 1);
                    },
                    child: Container(
                      // color: Colors.red,
                      // height: 40.h,
                      child: ImageCard(
                          image: categoriesProvider.categories[index].image,
                          title: categoriesProvider.categories[index].name),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
