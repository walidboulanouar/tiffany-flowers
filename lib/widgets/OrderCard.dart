import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderCard extends StatelessWidget {
  Color orderColor;
  bool reorder;
  OrderCard({required this.orderColor, required this.reorder, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.sp),
      color: orderColor,
      child: Row(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 12.h,
              width: 12.h,
              child: Image.asset(
                "assets/images/bouket.jpg",
                fit: BoxFit.fill,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            // elevation: 1,
            margin: EdgeInsets.only(
                left: 8.sp, right: 8.sp, bottom: 8.sp, top: 8.sp),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                width: 25.w,
                child: FittedBox(
                    child: Text("DFTHG-GHJL",
                        style:
                            TextStyle(fontSize: 10.sp, color: Colors.white)))),
            SizedBox(height: 2.h),
            Container(
                width: 25.w,
                child: FittedBox(
                    child: Text("Quantity:6 Items",
                        style: TextStyle(
                            fontSize: 9.sp,
                            color: Color.fromARGB(133, 255, 255, 255))))),
            SizedBox(height: 2.h),
            Container(
              width: 25.w,
              child: FittedBox(
                  child: Text("Value:250 AED",
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: Color.fromARGB(133, 255, 255, 255)))),
            ),
          ]),
          SizedBox(
            width: 20.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            reorder
                ? SizedBox.fromSize(
                    size: Size(8.h, 8.h), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.transparent, // button color
                        child: InkWell(
                          // splashColor: Colors.green, // splash color
                          onTap: () {}, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Icon(Icons.keyboard_double_arrow_down,color: Colors.white,),// icon
                              ImageIcon(
                                size:15.sp,
                                AssetImage("assets/images/reorder.png"),
                                color: Colors.white,
                              ),
                              Container(
                                // width: 6.h,
                                margin: EdgeInsets.only(top:2.sp),
                                padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical:2.sp),
                                decoration: BoxDecoration(
                                   color: Color(0xffD8AA6B),
                                  borderRadius: BorderRadius.circular(18),
                                 
                                ),
                               
                                child: FittedBox(
                                    child: Text("Re-Order",
                                        style: TextStyle(
                                            fontSize: 7.sp,
                                            color: Colors.white
                                                ))),
                              ), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 6.h,
                    width: 6.h,
                  ),
            SizedBox(height: 5.h),
            Container(
                margin: EdgeInsets.only(bottom: 5.sp),
                child: Text("05:19 PM",
                    style: TextStyle(
                        fontSize: 7.sp,
                        color: Color.fromARGB(133, 255, 255, 255)))),
          ]),
        ],
      ),
    );
  }
}
