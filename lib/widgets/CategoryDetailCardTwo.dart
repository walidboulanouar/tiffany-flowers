import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/CartItem.dart';
import '../providers/CartProvider.dart';
import '../providers/WishListProvider.dart';
import '../screens/DetailsScreen.dart';
import '../services/SqlService.dart';
import '../translations/locale_keys.g.dart';

class CategoryDetailCardTwo extends StatefulWidget {
  int id;
 String image;
  String name;
  int price;
  CategoryDetailCardTwo({Key? key, required this.id,required this.image,required this.name,required this.price}) : super(key: key);

  @override
  State<CategoryDetailCardTwo> createState() => _CategoryDetailCardTwoState();
}

class _CategoryDetailCardTwoState extends State<CategoryDetailCardTwo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WishListProvider wlProvider =
        Provider.of<WishListProvider>(context, listen: false);
    var sqlService = SqlService();
     
     sqlService.getProducts(wlProvider);
  }
  Widget build(BuildContext context) {
    var sqlService = SqlService();
    WishListProvider  wlProvider = Provider.of<WishListProvider>(context);
     CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Card(
      
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      color: Colors.white,
      child: Row(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 18.h,
              width: 25.w,
              child:CachedNetworkImage(
        imageUrl: widget.image,
        progressIndicatorBuilder: (context, url, downloadProgress) => 
                Container(

                  height: 9.h,
                  width: 9.h,
                  child: Center(
                    child: CircularProgressIndicator(
                      
                      color: Color(0xff73BFBD),
                      value: downloadProgress.progress),
                  ),
                ),
        errorWidget: (context, url, error) => Container(
          height: 9.h,
          width: 20.h,
          child: Image.asset("assets/images/errorimage.png")),
     ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            // elevation: 1,
            margin: EdgeInsets.only(
                left: 8.sp, right: 8.sp, bottom: 8.sp, top: 8.sp),
          ),
          Flexible(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h),
                  Container(
                    padding: EdgeInsets.only(left: 8.sp),
                    constraints:  BoxConstraints(minHeight: 0, maxHeight:2.h),
                  width: 50.w, 
                                 // child: Text(
                  //    overflow: TextOverflow.ellipsis,
                  //   widget.name.toLowerCase(),
                  //     style: TextStyle(
                  //       fontSize: 10.sp,
                  //       color: Color(0xff73BFBD),
                  //     )),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.name.toLowerCase(),
                      style: TextStyle(fontSize: 10.sp, color: Color(0xff73BFBD)),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.only(left: 8.sp),
                    child: RichText(
                      text: TextSpan(
                          text: widget.price.toString(),
                          style: TextStyle(
                              fontFamily: "Lucida Calligraphy",
                              fontSize: 12.sp,
                              color: Color(0xffD8AA6B)),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' AED',
                              style: TextStyle(
                                  fontSize: 8.sp, color: Color(0xffD8AA6B)),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    // color: Colors.red,

                    child: Row(
                      children: [
                        SizedBox(
                          width: 8.sp,
                        ),
                        TextButton.icon(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(12.w, 20.sp)),
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                              fixedSize:
                                  MaterialStateProperty.all(Size(25.w, 23.sp)),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff73BFBD))),
                          onPressed: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          (DetailsScreen(
                                       productId: widget.id,
                                      )),
                                    ),
                                  );
                        
                          },
                          icon: Text(LocaleKeys.Add_To_Cart.tr(),
                              style: TextStyle(
                                fontSize: 6.sp,
                                color: Colors.white,
                              )),
                          label: Icon(Icons.add, size: 8.sp, color: Colors.white),
                        ),
                         !wlProvider.wishList.contains(widget.id)?Flexible(
                           child: IconButton(
                                               onPressed: () {
                                                 sqlService.saveProduct(widget.id, wlProvider);
                           showGeneralDialog(
                            context: context,
                            barrierDismissible: false,
                            
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return SafeArea(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    padding: EdgeInsets.all(20),
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Lottie.asset(
                                          "assets/images/wishlist.json"),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                                               },
                                               icon: Icon(
                                                 Icons.favorite_border,
                                                 size: 14.sp,
                                                 color: Colors.red,
                                               )),
                         ):
                      Flexible(
                        child: IconButton(
                        onPressed: () {
                          sqlService.deleteProduct(widget.id, wlProvider);
                          
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 14.sp,
                          color: Colors.red,
                        )),
                      )
                      ],
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
