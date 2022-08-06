import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class CategoryDetailCard extends StatelessWidget {
  String image;
  // String title;
  CategoryDetailCard({Key? key, required this.image, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Card(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Column(
        children: [
          Container(
            height: 25.h,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 0,
              margin: EdgeInsets.only(
                  left: 8.sp, right: 8.sp, bottom: 3.sp, top: 5.sp),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 8.sp,
              ),
              Text("Vase Arrangement 0016",
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: Color(0xff73BFBD),
                  )),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 8.sp,
              ),
              Padding(
                padding:  EdgeInsets.only(top: 4.sp),
                child:
                RichText(
                    text: TextSpan(
                        text: '20',
                        style: TextStyle(
                          fontFamily: "Lucida Calligraphy",
                            fontSize: 12.sp, color: Color(0xffD8AA6B)),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' AED',
                            style: TextStyle(
                                fontSize: 8.sp, color: Color(0xffD8AA6B)),
                          ),
                        ]),
                  ),
                
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 8.sp,
              ),
              Expanded(
                child: TextButton.icon(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(12.w, 20.sp)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                      fixedSize: MaterialStateProperty.all(Size(27.w, 20.sp)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff73BFBD))),
                  onPressed: () {},
                  icon: Text("Add To Cart",
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.white,
                      )),
                  label: Icon(Icons.add, size: 10.sp, color: Colors.white),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    size: 14.sp,
                    color: Colors.red,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
