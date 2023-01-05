import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../models/Banner.dart' as b;
import '../providers/IndexProvider.dart';
import '../screens/HomeScreen.dart';
import '../translations/locale_keys.g.dart';

class CarouselImage extends StatefulWidget {
  List<b.Banner> banners;
  CarouselImage({Key? key, required this.banners}) : super(key: key);

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  CarouselController carouselController = CarouselController();
  int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
     IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    List<String> featuredImages = widget.banners.map((e) => e.image).toList();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        // decoration:BoxDecoration(border: Border.all(color: Colors.red),),
        width: 100.w,
        height: 30.h,
        child: Stack(
          children: [
            Container(
              child: CarouselSlider(
                carouselController: carouselController, // Give the controller
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) => {
                    setState(() {
                      currentIndexPage = index;
                    })
                  },
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  
                  disableCenter: false,
                  aspectRatio: 1,
                  height: 30.h,
                  viewportFraction: 1,
                  autoPlay: true,
                ),
                items: featuredImages.map((featuredImage) {
                  return FittedBox(
                    fit: BoxFit.fill,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      imageUrl: featuredImage,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Container(
                        height: 9.h,
                        width: 9.h,
                        child: Center(
                          child: CircularProgressIndicator(
                              color: Color(0xff73BFBD),
                              value: downloadProgress.progress),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                          height: 24.h,
                          width: 20.h,
                          child: Image.asset("assets/images/errorimage.png")),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              width: 100.w,
              height: 30.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff73BFBD),
                      Color.fromARGB(0, 244, 243, 243),
                    ],
                    begin: const FractionalOffset(0.3, 0.3),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.sp),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  alignment: Alignment.center,
                  height: 10.w,
                  width: 10.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: Color(0xff73BFBD),
                  ),
                  // radius: 15,
                  // backgroundColor:Color(0xff73BFBD),
                  child: IconButton(
                    onPressed: () {
                      // Use the controller to change the current page
                      carouselController.previousPage();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 12.sp,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.sp),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  alignment: Alignment.center,
                  height: 10.w,
                  width: 10.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: Color(0xff73BFBD),
                  ),
                  // radius: 15,
                  // backgroundColor:Color(0xff73BFBD),
                  child: IconButton(
                    onPressed: () {
                      // Use the controller to change the current page
                      carouselController.nextPage();
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 12.sp,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              height: 10.h,
              width: 70.w,
              top: 8.h,
              left: 17.w,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Container(
                        // color: Colors.red,
                        height: 30.sp,
                        width: 100.w,
                        child: Text(
                          // textAlign:TextAlign.left,
                          widget.banners.isNotEmpty
                              ? widget.banners[currentIndexPage].text
                              : "",
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                              // fontStyle: FontStyle.italic,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                       onTap: (() {
                        print("zzzzzzzzz");
                          categoriesScreen.currentState!.canPop()
            ? categoriesScreen.currentState!.pop():null;
             indexProvider.setCurrentIndex(1);
                       }),
                        child: Container(
                          height: 3.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            color: Color(0xffD8AA6B),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                              child: FittedBox(
                            child: Container(
                              height: 3.h,
                              child: Center(
                                child: Text(
                                  LocaleKeys.View_More,
                                  style: TextStyle(
                                      fontSize: 8.sp, color: Colors.white),
                                ).tr(),
                              ),
                            ),
                          )),
                        ),
                      ),
                    )
                  ]),
            ),
            Positioned(
                bottom: 2.h,
                left: 40.w,
                child: featuredImages.length != 0
                    ? DotsIndicator(
                        dotsCount: featuredImages.length,
                        position: double.parse(currentIndexPage.toString()),
                        decorator: DotsDecorator(
                            color: Colors.white, // Inactive color
                            activeColor: Colors.black),
                      )
                    : Container())
          ],
        ),
      ),
    );
  }
}
