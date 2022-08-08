import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentCard extends StatelessWidget {
  PaymentCard({Key? key}) : super(key: key);

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
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.sp,top: 4.sp),
                  child: Text(
                    "Vase Arrangement 0016",
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
                    child: Text("Small",
                        style: TextStyle(
                            fontSize: 8.sp,
                            color: Color.fromARGB(86, 80, 80, 80))),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.sp),
                    child: RichText(
                      text: TextSpan(
                          text: '20',
                          style: TextStyle(
                              fontFamily: "Lucida Calligraphy",
                              fontSize: 12.sp,
                              color: Color(0xffD8AA6B)),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'AED',
                              style: TextStyle(
                                  fontSize: 8.sp, color: Color(0xffD8AA6B)),
                            ),
                          ]),
                    ),
                  ),
                ]),
              ]),
        ],
      ),
    );
  }
}
