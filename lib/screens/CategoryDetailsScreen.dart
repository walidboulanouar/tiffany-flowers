import 'package:ecomerceapp/providers/ProductProvider.dart';
import 'package:ecomerceapp/providers/WishListProvider.dart';
import 'package:ecomerceapp/screens/CategoriesScreen.dart';
import 'package:ecomerceapp/services/SqlService.dart';
import 'package:ecomerceapp/widgets/CategoryAppBar.dart';
import 'package:ecomerceapp/widgets/CategoryDetailCard.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/Category.dart';

import '../providers/CategoriesProvider.dart';
import '../services/Services.dart';
import '../widgets/CategoryDetailCardTwo.dart';
import 'DetailsScreen.dart';
import 'HomeScreen.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final int catId;
  final String name;
  CategoryDetailsScreen({Key? key, required this.name, required this.catId})
      : super(key: key);

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  void initState() {
    super.initState();

    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    
    getProductsByCatgory(
      widget.catId,
      productProvider,
    );
    // TODO: implement initState
  }

  Color active_color = Color(0xff73BFBD);
  Color in_active_color = Color(0xffB9B9B9);
  bool active = true;
  void setActive() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    
    print(productProvider.categoryproducts);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Container(
          height: 6.h,
          width: 6.h,
          child: FloatingActionButton(
            heroTag: Text("btn3"),
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
                Navigator.of(context).pop();
              },
              title: widget.name.toString(),
            ),
            
            Flexible(
              child: active
                  ? StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 20.sp,top: 0),
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.sp,
                      mainAxisSpacing: 15.sp,
                      itemCount: productProvider.categoryproducts.length + 1,
                      itemBuilder: (BuildContext context, int index) => index == 0
                          ? Wrap(children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      active = true;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.grid_view_outlined,
                                    size: 14.sp,
                                    color:
                                        active ? active_color : in_active_color,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      active = false;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.list,
                                    size: 22.sp,
                                    color:
                                        !active ? active_color : in_active_color,
                                  )),
                            ])
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        (DetailsScreen(
                                      productId: productProvider
                                          .categoryproducts[index - 1].id,
                                    )),
                                  ),
                                );
                              },
                              child: CategoryDetailCard(
                                id: productProvider
                                    .categoryproducts[index - 1].id,
                                name: productProvider
                                    .categoryproducts[index - 1].name,
                                image: productProvider
                                    .categoryproducts[index - 1].images[0],
                                price: productProvider
                                    .categoryproducts[index - 1].price,
                                // title: widget.categories[index-1].title
                                // .toString()
                              ),
                            ),
                      staggeredTileBuilder: (int index) => StaggeredTile.count(
                          index == 0 ? 2 : 1, index == 0 ? 0.21 : 1.45),
                    )
                  : StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      crossAxisCount: 2,
                     
                      crossAxisSpacing: 5.sp,
                      mainAxisSpacing: 15.sp,
                      itemCount: productProvider.categoryproducts.length + 1,
                      itemBuilder: (BuildContext context, int index) => index == 0
                          ? Wrap(children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      active = true;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.grid_view_outlined,
                                    size: 14.sp,
                                    color:
                                        active ? active_color : in_active_color,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      active = false;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.list,
                                    size: 22.sp,
                                    color:
                                        !active ? active_color : in_active_color,
                                  )),
                            ])
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        (DetailsScreen(
                                            productId: productProvider
                                                .categoryproducts[index - 1].id)),
                                  ),
                                );
                              },
                              child: CategoryDetailCardTwo(
                                id: productProvider
                                    .categoryproducts[index - 1].id,
                                name: productProvider
                                    .categoryproducts[index - 1].name,
                                image: productProvider
                                    .categoryproducts[index - 1].images[0],
                                price: productProvider
                                    .categoryproducts[index - 1].price,
                              ),
                            ),
                      staggeredTileBuilder: (int index) => StaggeredTile.count(
                          index == 0 ? 2 : 2, index == 0 ? 0.21 : 0.8),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
