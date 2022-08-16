import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/CartItem.dart';
import '../providers/CartProvider.dart';
import '../providers/WishListProvider.dart';
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
    return Card(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Column(
        children: [
          Container(
            height: 25.h,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
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
              Text(widget.name,
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: Color(0xff73BFBD),
                  )),
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 8.sp,
              ),
              Expanded(
                child: TextButton.icon(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(12.w, 20.sp)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                      fixedSize: MaterialStateProperty.all(Size(27.w, 20.sp)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff73BFBD))),
                  onPressed: () {
                    sqlService.addToCart(
                        CartItem(
                            productId: widget.id,
                            name: widget.name,
                            color: 0xffD8AA6B,
                            count: 1,
                            image: widget.image.toString(),
                            price: widget.price,
                            size: "small",
                            sizePrice: 20),
                        cartProvider);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                           behavior: SnackBarBehavior.floating,
                          content: Text("Added to Cart")));
                  },
                  icon: Text("Add To Cart",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.white,
                      )),
                  label: Icon(Icons.add, size: 10.sp, color: Colors.white),
                ),
              ),
              !wlProvider.wishList.contains(widget.id)
                  ? IconButton(
                      onPressed: () {
                        sqlService.saveProduct(widget.id, wlProvider);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                               behavior: SnackBarBehavior.floating,
                              content: Text("added to wishlist")));
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        size: 14.sp,
                        color: Colors.red,
                      ))
                  : IconButton(
                      onPressed: () {
                        sqlService.deleteProduct(widget.id, wlProvider);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                               behavior: SnackBarBehavior.floating,
                              content: Text("removed from  wishlist")));
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 14.sp,
                        color: Colors.red,
                      ))
            ],
          )
        ],
      ),
    );
  }
}
