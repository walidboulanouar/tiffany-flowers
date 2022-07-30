import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartCard extends StatelessWidget {
  CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.only(left: 8.sp),
                  child: Text(
                    "Vase Arrangement 0016",
                    style: TextStyle(fontSize: 12.sp, color: Color(0xff73BFBD)),
                  ),
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.only(left: 8.sp),
                  child: Text("Small",
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
                          text: '24',
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
                  SizedBox(width: 20.w),
                  Container(
                    width: 24.w,
                    padding: EdgeInsets.symmetric(horizontal: 2.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xff73BFBD)),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {},
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
                              '3',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.sp),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {},
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
