import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerceapp/models/OrderItem.dart';
import 'package:ecomerceapp/screens/ReorderScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/Order.dart';
import '../providers/OrderProvider.dart';
import '../services/Services.dart';

class OrderCard extends StatefulWidget {
  Color orderColor;
  bool reorder;
  Order order;

  OrderCard(
      {required this.orderColor,
      required this.reorder,
      required this.order,
      Key? key})
      : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
 

  @override
  Widget build(BuildContext context) {
    DateTime tempDate = DateTime.parse(widget.order.startDate);
    // OrderProvider orderProvider = Provider.of<OrderProvider>(context);
// print(orderItems[0].size);
// print(orderImg);
    return Card(
      margin: EdgeInsets.all(10.sp),
      color: widget.orderColor,
      child: Row(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: widget.order.orderImg != null
                ? Container(
                    height: 14.h,
                    width: 10.h,
                    child:FittedBox(
                      fit: BoxFit.cover,
                      child: CachedNetworkImage(
                            imageUrl: widget.order.orderImg,
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
                  )
                : Container(
                    height: 12.h,
                    width: 12.h,
                    color: Color.fromARGB(255, 127, 127, 127),
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
                // padding: EdgeInsets.only(left: 8.sp),
                width: 25.w,
                child: FittedBox(
                    child: Text(widget.order.orderId,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontFamily: '',
                            fontWeight: FontWeight.bold)))),
            SizedBox(height: 2.h),
            Container(
                width: 25.w,
                child: FittedBox(
                    child: Text("Quantity: ${widget.order.itemCount} Items",
                        style: TextStyle(
                            fontSize: 9.sp,
                            color: Color.fromARGB(133, 255, 255, 255))))),
            SizedBox(height: 2.h),
            Container(
              width: 25.w,
              child: FittedBox(
                  child: Text("Value: ${widget.order.subTotal} AED",
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: Color.fromARGB(133, 255, 255, 255)))),
            ),
          ]),
          SizedBox(
            width: 21.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            widget.reorder
                ? SizedBox.fromSize(
                    size: Size(8.h, 8.h), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.transparent, // button color
                        child: InkWell(
                          // splashColor: Colors.green, // splash color
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (_) => ReorderScreen(order:widget.order,),
                                ),
                              );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Icon(Icons.keyboard_double_arrow_down,color: Colors.white,),// icon
                              ImageIcon(
                                size: 15.sp,
                                AssetImage("assets/images/reorder.png"),
                                color: Colors.white,
                              ),
                              Container(
                                // width: 6.h,
                                margin: EdgeInsets.only(top: 2.sp),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.sp, vertical: 2.sp),
                                decoration: BoxDecoration(
                                  color: Color(0xffD8AA6B),
                                  borderRadius: BorderRadius.circular(18),
                                ),

                                child: FittedBox(
                                    child: Text("Re-Order",
                                        style: TextStyle(
                                            fontSize: 7.sp,
                                            color: Colors.white))),
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
                child: Text(DateFormat.Hm().format(tempDate),
                    // tempDate.hour.toString()+":"+tempDate.minute.toString(),
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Color.fromARGB(133, 255, 255, 255)))),
          ]),
        ],
      ),
    );
  }
}
