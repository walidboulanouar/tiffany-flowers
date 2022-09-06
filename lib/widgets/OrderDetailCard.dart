import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderDetailCard extends StatelessWidget {
  String image;
  String name;
  int quantity;
  double price;
  OrderDetailCard({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      color: Colors.white,
      child: Row(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 13.h,
              width: 10.h,
              child: Image.network(
                image,
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
          Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.sp, top: 8.sp),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 9.sp, color: Color(0xff73BFBD)),
                  ),
                ),
                // SizedBox(height: 1.h),
                Container(
                  height: 5.h,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8.sp,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Quantity: ",
                            style: TextStyle(
                                // fontFamily: "Lucida Calligraphy",
                                fontSize: 8.sp,
                                color: Color(0xff505050)),
                            children: <TextSpan>[
                              TextSpan(
                                text: quantity.toString(),
                                style: TextStyle(
                                    fontSize: 9.sp, color: Color(0xff505050)),
                              ),
                              TextSpan(
                                text: " Items",
                                style: TextStyle(
                                    fontSize: 8.sp, color: Color(0xff505050)),
                              ),
                            ]),
                      ),
                      SizedBox(
                        width: 7.sp,
                      ),
                      TextButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(10.w, 15.sp)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            )),
                            fixedSize:
                                MaterialStateProperty.all(Size(15.w, 20.sp)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff73BFBD))),
                        onPressed: () {},
                        child: FittedBox(
                          child: Text("${price*quantity} AED",
                              style: TextStyle(
                                // fontSize: 16.sp,
                                color: Colors.white,
                              )),
                        ),
                        // label:Container(),
                        //  Icon(Icons.add,
                        //     size: 12.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 0.h),
                Container(
                  height: 4.h,
                  // color: Colors.blue,
                  child: Row(
                    children: [
                      // SizedBox(
                      //   width: 8.sp,
                      // ),
                      Text("Item Price: ${price} AED",
                          style: TextStyle(
                            fontSize: 7.sp,
                            color: Color(0xffD8AA6B),
                          )),
                      Container(
                        width: 9.w,
                      )
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(
                      //       Icons.favorite,
                      //       size: 14.sp,
                      //       color: Colors.red,
                      //     ))
                    ],
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
