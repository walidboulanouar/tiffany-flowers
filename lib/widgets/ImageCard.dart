import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class ImageCard extends StatelessWidget {
  final String image;
  final String? title;
  ImageCard({Key? key, required this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Card(
            
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CachedNetworkImage(
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) => 
                Container(

                  height: 9.h,
                  width: 9.h,
                  child: Center(
                    child: CircularProgressIndicator(
                      
                      color: Color(0xff73BFBD),
                      value: downloadProgress.progress),
                  ),
                ),
        errorWidget: (context, url, error) => Container(
          height: 20.h,
          width: 18.h,
          child: Image.asset("assets/images/errorimage.png")),
     )
            
           , shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            // elevation: 1,
            margin: EdgeInsets.only(left: 8.sp, right: 8.sp, bottom: 3.sp),
          ),
        ),
        title != null
            ? Container(
                // color: Colors.red,
                width: 30.w,
                height: 5.h,
                 constraints:  BoxConstraints(minHeight: 0, maxHeight:2.h),
                  
                 
                

                margin: EdgeInsets.only(top: 0.3.h),
                child: Padding(
                  padding:  EdgeInsets.only(left:title!.length>15?0.0:6.sp),
                  child: Text(title!.length>15?title!.toLowerCase().substring(0,14)+"..":title!.toLowerCase(),
                  overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: Color(0xffD8AA6B),
                      )),
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
              SizedBox(height: 6.sp,)
      ],
    );
  }
}
