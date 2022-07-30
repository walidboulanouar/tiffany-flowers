import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryDetailCardTwo extends StatelessWidget {
  String image;
  CategoryDetailCardTwo({Key? key, required this.image}) : super(key: key);

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
              height: 18.h,
              width: 12.h,
              child: Image.asset(
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.sp),
                  child: Text(
                    "Vase Arrangement 0016",
                    style: TextStyle(fontSize: 10.sp, color: Color(0xff73BFBD)),
                  ),
                ),
                SizedBox(height: 1.h),
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
                            text: ' AED',
                            style: TextStyle(
                                fontSize: 8.sp, color: Color(0xffD8AA6B)),
                          ),
                        ]),
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    SizedBox(
                      width: 8.sp,
                    ),
                    TextButton.icon(
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(Size(12.w, 22.sp)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                          fixedSize:
                              MaterialStateProperty.all(Size(27.w, 10.sp)),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff73BFBD))),
                      onPressed: () {},
                      icon: Text("Add To Cart",
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.white,
                          )),
                      label: Icon(Icons.add, size: 12.sp, color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          size: 15.sp,
                          color: Colors.red,
                        ))
                  ],
                )
              ]),
        ],
      ),
    );
  }
}
