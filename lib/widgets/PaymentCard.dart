import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentCard extends StatelessWidget {
  String image;
  String name;
  String size;
  int quantity;
  int price;
  PaymentCard({
    Key? key,
    required this.image,
    required this.name,
    required this.size,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(10.sp),
      color: Colors.white,
      child: Row(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 10.h,
              width: 15.w,
              child: CachedNetworkImage(
        imageUrl: image,
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
          height: 24.h,
          width: 20.h,
          child:Image.asset("assets/images/errorimage.png")),
     )
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
                
                Container(
                  width: 60.w,
                  constraints:  BoxConstraints(minHeight: 0, maxHeight:4.h),
                  padding: EdgeInsets.only(left: 8.sp, top: 4.sp),
                  child: Text(
                     overflow: TextOverflow.ellipsis,
                    name.toLowerCase(),
                    style: TextStyle(fontSize: 10.sp, color: Color(0xff73BFBD)),
                  ),
                ),
                // SsizedBox(height: 2.h),
                // Padding(
                //   padding: EdgeInsets.only(left: 8.sp),
                //   child: Text("Small",
                //       style: TextStyle(
                //           fontSize: 9.sp,
                //           color: Color.fromARGB(86, 80, 80, 80))),
                // ),
                SizedBox(height: 1.h),
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.sp),
                    child: Text(size,
                        style: TextStyle(
                            fontSize: 8.sp,
                            color: Color.fromARGB(86, 80, 80, 80))),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.sp),
                    child: Text("${quantity} items",
                        style: TextStyle(
                            fontSize: 8.sp,
                            color: Color.fromARGB(86, 80, 80, 80))),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    width: 20.w,
                    padding: EdgeInsets.only(left: 8.sp),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: RichText(
                        text: TextSpan(
                            text: price.toString(),
                            
                            style: TextStyle(
                                fontFamily: "Lucida Calligraphy",
                                fontSize: 8.sp,
                                color: Color(0xffD8AA6B)),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'AED',
                                style: TextStyle(
                                    fontSize: 6.sp, color: Color(0xffD8AA6B)),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ]),
              ]),
        ],
      ),
    );
  }
}
