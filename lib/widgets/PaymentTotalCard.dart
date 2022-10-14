import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../translations/locale_keys.g.dart';

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
                    LocaleKeys.Subtotal.tr(),
                    style: TextStyle(color: Colors.white,fontSize: 10.sp),
                  ),
                ),
                SizedBox(
                  width: 41.w,
                ),
                Text(
                  subTotal.toString()
                  ,
                  style: TextStyle(color: Colors.white,fontSize: 8.sp),
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
                   LocaleKeys.Shippingcost.tr(),
                    style: TextStyle(color: Colors.white,fontSize: 10.sp),
                  ),
                ),
                SizedBox(
                  width: 45.w,
                ),
                Text(
                  shipping_cost. toString(),
                  style: TextStyle(color: Colors.white,fontSize: 8.sp),
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
                    LocaleKeys.Tax.tr(),
                    style: TextStyle(color: Colors.white,fontSize: 10.sp),
                  ),
                ),
                SizedBox(
                  width: 52.w,
                ),
                Text(
                  "5%",
                  style: TextStyle(color: Colors.white,fontSize: 8.sp),
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
                          text: LocaleKeys.Total.tr(),
                          style: TextStyle(
                              fontFamily: "Lucida Calligraphy",
                              fontSize: 14.sp,
                              color: Color(0xff73BFBD)),
                          children: <TextSpan>[
                            TextSpan(
                              text: '( ${LocaleKeys.IncludeTax.tr()})',
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
