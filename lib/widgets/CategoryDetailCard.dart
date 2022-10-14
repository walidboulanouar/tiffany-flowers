import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecomerceapp/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/CartItem.dart';
import '../providers/CartProvider.dart';
import '../providers/WishListProvider.dart';
import '../screens/DetailsScreen.dart';
import '../services/SqlService.dart';

class CategoryDetailCard extends StatefulWidget {
  int id;
  String image;
  String name;
  int price;
  // String title;
  CategoryDetailCard(
      {Key? key,
      required this.id,
      required this.image,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  State<CategoryDetailCard> createState() => _CategoryDetailCardState();
}

class _CategoryDetailCardState extends State<CategoryDetailCard> {
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
    WishListProvider wlProvider = Provider.of<WishListProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      child: Card(
        elevation: 3,
        // shadowColor: Color.fromARGB(31, 9, 7, 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        // color: Colors.red,
        margin: EdgeInsets.symmetric(horizontal: 10.sp),
        child: Column(
          children: [
            Flexible(
              // padding: EdgeInsets.all(0),
              // color: Colors.red,
              // height: 23.h,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Container(
                    height: 20.h,
                    width: 20.h,
                    child: Center(
                      child: CircularProgressIndicator(
                          color: Color(0xff73BFBD),
                          value: downloadProgress.progress),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                      height: 24.h,
                      width: 20.h,
                      child: Image.asset("assets/images/errorimage.png")),
                ),
                elevation: 0,
                margin: EdgeInsets.only(
                    left: 8.sp, right: 8.sp, bottom: 3.sp, top: 5.sp),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 8.sp,
                ),
                Container(
                  width: 38.w,
                  constraints: BoxConstraints(minHeight: 0, maxHeight: 4.h),
                  child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.name.toLowerCase(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Color(0xff73BFBD),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 8.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.sp),
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
              ],
            ),
            SizedBox(
              height: 8.sp,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 8.sp,
                ),
                Expanded(
                  child: TextButton.icon(
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(Size(12.w, 20.sp)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                        fixedSize: MaterialStateProperty.all(Size(27.w, 23.sp)),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff73BFBD))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => (DetailsScreen(
                            productId: widget.id,
                          )),
                        ),
                      );
                    },
                    icon: Text(LocaleKeys.Add_To_Cart.tr(),
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.white,
                        )),
                    label: Icon(Icons.add, size: 12.sp, color: Colors.white),
                  ),
                ),
                !wlProvider.wishList.contains(widget.id)
                    ? IconButton(
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
                        ))
                    : IconButton(
                        onPressed: () {
                          sqlService.deleteProduct(widget.id, wlProvider);
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 14.sp,
                          color: Colors.red,
                        ))
              ],
            ),
            SizedBox(height: 2.h,)
          ],
        ),
      ),
    );
  }
}
