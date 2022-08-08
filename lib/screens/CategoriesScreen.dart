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
import '../services/CategoriesService.dart';
import 'HomeScreen.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Category> categories;
  final GlobalKey<NavigatorState> categoriesScreen;
  CategoriesScreen(
      {Key? key, required this.categories, required this.categoriesScreen})
      : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    CategoriesProvider  categoriesProvider = Provider.of<CategoriesProvider>(context);
    getCategories(categoriesProvider);
  }
  // @override
  // void initState() {
  //   super.initState();
  //   CategoriesProvider  categoriesProvider = Provider.of<CategoriesProvider>(context);
  //   getCategories(categoriesProvider);
  //   // TODO: implement initState
    
  // }
  
  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    // CategoriesProvider  categoriesProvider = Provider.of<CategoriesProvider>(context);
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
          onPressed: () {},
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
                padding: EdgeInsets.all(0),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    // childAspectRatio: 3 / 2,
                    crossAxisSpacing: 1.sp,
                    mainAxisSpacing: 8.sp),
                itemCount: widget.categories.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {    
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              (CategoryDetailsScreen(
                            categories: [
                              Category(
                                id: 1,
                                  image: "assets/images/bouket3.jfif",
                                  name: "Hand Bouket"),Category(
                                id: 2,
                                  image: "assets/images/bouket3.jfif",
                                  name: "Hand Bouket"),
                            ],
                            title: widget.categories[index].name,
                          )),
                        ),
                      );

                      // Navigator.of(context).pushNamed('/categorydetails');
                      // _categoriesScreen.currentState?.pushNamed('/categorydetails');
                      // changeWidget(CategoryDetailsScreen(categories: []), 1);
                    },
                    child: ImageCard(
                        image: widget.categories[index].image,
                        title: widget.categories[index].name),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
