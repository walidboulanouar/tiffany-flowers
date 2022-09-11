import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerceapp/providers/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/CartItem.dart';
import '../services/SqlService.dart';

class CartCard extends StatelessWidget {
  CartItem item;
  CartCard({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var sqlService = SqlService();
     CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Card(
      margin: EdgeInsets.all(10.sp),
      color: Colors.white,
      child: Row(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 17.h,
              width: 12.h,
              child:FittedBox(
                fit: BoxFit.cover,
                child: CachedNetworkImage(
                      imageUrl: item.image,
                      progressIndicatorBuilder: (context, url, downloadProgress) => 
                  Container(
              
                    height: 9.h,
                    width: 9.h,
                    child: CircularProgressIndicator(
                      
                      color: Color(0xff73BFBD),
                      value: downloadProgress.progress),
                  ),
                      errorWidget: (context, url, error) => Container(
                        height: 24.h,
                        width: 20.h,
                        child: Image.asset("assets/images/errorimage.png")),
                   ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            // elevation: 1,
            margin: EdgeInsets.only(
                left: 8.sp, right: 8.sp, bottom: 8.sp, top: 8.sp),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.sp),
                  child: Text(
                    textAlign:TextAlign.center,
                    item.name.toLowerCase(),
                    style: TextStyle(fontSize: 7.sp, color: Color(0xff73BFBD)),
                  ),
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.only(left: 8.sp),
                  child: Text(item.size,
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: Color.fromARGB(86, 80, 80, 80))),
                ),
                SizedBox(height: 2.h),
                Row(children: [
                  Padding(
                    padding:  EdgeInsets.only(left:8.sp),
                    child: RichText(
                      text: TextSpan(
                          text: item.price.toString(),
                          style: TextStyle(
                            fontFamily: "Lucida Calligraphy",
                              fontSize: 12.sp, color: Color(0xffD8AA6B)),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'AED',
                              style: TextStyle(
                                  fontSize: 10.sp, color: Color(0xffD8AA6B)),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    width: 24.w,
                    padding: EdgeInsets.symmetric(horizontal: 2.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xff73BFBD)),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              if(item.count>1){
                                 sqlService.editCount(item.productId,item.count-1,cartProvider);
                              }
                             
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 14.sp,
                            )),
                        Center(
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 3),
                            padding: EdgeInsets.only(
                                bottom: 4.sp, left: 12.sp, right: 8.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Color(0xff73BFBD)),
                            child: Text(
                              item.count.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.sp),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                             sqlService.editCount(item.productId,item.count+1,cartProvider);
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 14.sp,
                            )),
                      ],
                    ),
                  ),
                ]),
              ]),
        ],
      ),
    );
  }
}
