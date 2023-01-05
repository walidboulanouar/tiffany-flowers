import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerceapp/widgets/ImageCard.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class NoLoopingSlider extends StatelessWidget {
  List<String> imgList;
  
  // final List<Widget> imageSliders = imgList
  //     .map((item) => Container(
  //           child: ImageCard(image: item)
  //         ))
  //     .toList();

  NoLoopingSlider({Key? key,required this.imgList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
          child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.7,
          aspectRatio: 1.40,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: false,
        ),
        items:imgList.isNotEmpty? imgList
      .map((item) => Container(
            child: ImgCard(image: item)
          ))
      .toList():[ImgCard(image: "null")],
      )
    );
  }
}
class ImgCard extends StatelessWidget {
  
  final String image;
  final String? title;
  ImgCard({Key? key, required this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Card(
            elevation: 2,
            
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CachedNetworkImage(
             
              fit: BoxFit.cover,
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
          height: 30.h,
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
