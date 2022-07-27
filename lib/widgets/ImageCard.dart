import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class ImageCard extends StatelessWidget {
  final String image;
  final String? title;
   ImageCard({Key? key, required this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(title);
    return
    Column(
      children: [
        Expanded(
          child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                 image,
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // elevation: 1,
                margin: EdgeInsets.only(left: 8.sp,right: 8.sp,bottom: 3.sp),
              ),
        ),
            title!=null?
            Container(
              // color: Colors.red,
              
                margin: EdgeInsets.only(top: 0.3.h),
                child: Center(
                  
                  child: Text(title!, style: TextStyle(fontSize: 8.sp,color: Color(0xffD8AA6B),)),
                ),
              )
            :Container(height: 0,width: 0,),
      ],
    );
    
  }
}