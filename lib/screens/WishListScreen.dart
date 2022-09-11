import 'package:ecomerceapp/widgets/CategoryAppBar.dart';
import 'package:ecomerceapp/widgets/CategoryDetailCard.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/Category.dart';

import '../models/Product.dart';
import '../providers/WishListProvider.dart';
import '../services/Services.dart';
import '../services/SqlService.dart';
import '../widgets/CategoryDetailCardTwo.dart';
import 'DetailsScreen.dart';

class WishListScreen extends StatefulWidget {
  // final List<Product> products;
  // String? title;
  WishListScreen({Key? key,})
      : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     
     WishListProvider  wlProvider = Provider.of<WishListProvider>(context,listen:false);
      
     Future.delayed(Duration.zero,(){
      
      getProductByIds(wlProvider.wishList,wlProvider);
       
  });
     
     
    
     
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
     WishListProvider  wlProvider = Provider.of<WishListProvider>(context);
     
    
    
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        height: 6.h,
        width: 6.h,
        child: FloatingActionButton(
          heroTag: Text("btn5"),
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
            myfc: (){
              Navigator.of(context).pop();
            },
            title: "Wish List",
          ),
          // SizedBox(
          //   height: 2.h,
          // ),
          // wlProvider.wishListProducts.length>0 ?
          Flexible(
            child: active
                ? StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top:0,bottom: 20.sp),
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.sp,
                    mainAxisSpacing: 15.sp,
                    itemCount: wlProvider.wishListProducts.length + 1,
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
                                      (DetailsScreen(productId:wlProvider.wishListProducts[index - 1].id,)),
                                ),
                              );
                            },
                            child: CategoryDetailCard(
                              
                              id: wlProvider.wishListProducts[index - 1].id,
                              name: wlProvider.wishListProducts[index - 1].name,
                              image: wlProvider.wishListProducts[index - 1].images[0],
                              price: wlProvider.wishListProducts[index - 1].price,
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
                    itemCount: wlProvider.wishListProducts.length + 1,
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
                                      (DetailsScreen(productId:wlProvider.wishListProducts[index - 1].id,)),
                                ),
                              );
                            },
                            child: CategoryDetailCardTwo(
                            id: wlProvider.wishListProducts[index - 1].id,
                              name: wlProvider.wishListProducts[index - 1].name,
                              image: wlProvider.wishListProducts[index - 1].images[0],
                              price: wlProvider.wishListProducts[index - 1].price,
                            ),
                          ),
                    staggeredTileBuilder: (int index) => StaggeredTile.count(
                        index == 0 ? 2 : 2, index == 0 ? 0.21 : 0.8),
                  ),
          )
          // :Container(height: 20.h,),
        ],
      ),
    );
  }
}
