import 'package:easy_localization/easy_localization.dart';
import 'package:ecomerceapp/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/CartProvider.dart';

class TotalCard extends StatelessWidget {
  // int price ;
  // int sizePrice;
  // int count;
  const TotalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
     CartProvider cartProvider =Provider.of<CartProvider>(context);
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
                  padding: EdgeInsets.only(left: 13.sp),
                  child: Text(
                    LocaleKeys.Subtotal.tr(),
                    style: TextStyle(color: Colors.white,fontSize: 10.sp),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  cartProvider.subTotal().toString()+" AED",
                  style: TextStyle(color: Colors.white,fontSize: 10.sp),
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
                             fontFamily: GoogleFonts.openSans().fontFamily,
                              fontSize: 14.sp,
                              color: Color(0xff73BFBD)),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' (${LocaleKeys.IncludeTax.tr()}) ',
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
                          text: cartProvider.Total().toString(),
                          style: TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontSize: 14.sp,
                              color: Color(0xffD8AA6B)),
                          children: <TextSpan>[
                            TextSpan(
                              text: '.AED',
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
