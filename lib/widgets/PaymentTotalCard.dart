import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class PaymentTotalCard extends StatelessWidget {
  int shipping_cost;
  int subTotal;
  int total;
   PaymentTotalCard({Key? key,required this.shipping_cost,required this.subTotal,required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 8.sp),
        color: Color(0xff73BFBD),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Text(
                    "subTotal",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  subTotal.toString()
                  ,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Text(
                    "Shipping cost",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 41.w,
                ),
                Text(
                  shipping_cost. toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
             SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Text(
                    "Tax",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 58.w,
                ),
                Text(
                  "5%",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 7.sp, horizontal: 5.sp),
              margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.sp,
                    ),
                    child: RichText(
                      text: TextSpan(
                          text: 'Total ',
                          style: TextStyle(
                              fontFamily: "Lucida Calligraphy",
                              fontSize: 14.sp,
                              color: Color(0xff73BFBD)),
                          children: <TextSpan>[
                            TextSpan(
                              text: '(Include Tax)',
                              style: TextStyle(
                                  fontSize: 10.sp, color: Color(0xff73BFBD)),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.sp),
                    child: RichText(
                      text: TextSpan(
                          text: '${total}.',
                          style: TextStyle(
                              fontFamily: "Lucida Calligraphy",
                              fontSize: 14.sp,
                              color: Color(0xffD8AA6B)),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'AED',
                              style: TextStyle(
                                  fontSize: 10.sp, color: Color(0xffD8AA6B)),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
