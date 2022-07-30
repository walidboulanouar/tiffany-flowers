import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class TotalCard extends StatelessWidget {
  const TotalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  ),
        margin: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 8.sp),
        color:
         Color(0xff73BFBD),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                  height: 2.h,
                ),
            Row(
              children: [
                
                Padding(
                  padding:  EdgeInsets.only(left:10.sp),
                  child: Text("subTotal",style: TextStyle(color: Colors.white),),
                ),
                SizedBox(
                  width: 40.w,
                ),
                Text("240.AED",style: TextStyle(color: Colors.white),)
              ],
            ),
            SizedBox(
                  height: 2.h,
                ),
            Row(
              children: [
                Padding(
                   padding:  EdgeInsets.only(left:10.sp),
                  child: Text("Delivary",style: TextStyle(color: Colors.white),),
                ),
                SizedBox(
                  width: 40.w,
                ),
                Text("20.AED",style: TextStyle(color: Colors.white),)
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 7.sp,horizontal: 5.sp),
              margin: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 10.sp),
              decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),),
              child: Row(children: [
              Padding(
                    padding:  EdgeInsets.only(left:8.sp,),
                    child: RichText(
                      text: TextSpan(
                          text: 'Total ',
                          style: TextStyle(
                            fontFamily: "Lucida Calligraphy",
                              fontSize: 14.sp, color: Color(0xffD8AA6B)),
                          children: <TextSpan>[
                            TextSpan(
                              text: '(Include Tax)',
                              style: TextStyle(
                                  fontSize: 10.sp, color: Color(0xffD8AA6B)),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                 Padding(
                    padding:  EdgeInsets.only(left:8.sp),
                    child: RichText(
                      text: TextSpan(
                          text: '260.',
                          style: TextStyle(
                            fontFamily: "Lucida Calligraphy",
                              fontSize: 14.sp, color: Color(0xffD8AA6B)),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'AED',
                              style: TextStyle(
                                  fontSize: 10.sp, color: Color(0xffD8AA6B)),
                            ),
                          ]),
                    ),
                  ),
            ],),)
            
          ],
        ));
  }
}

