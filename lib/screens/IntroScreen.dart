import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../translations/locale_keys.g.dart';
import '../widgets/CustomBottomSheet.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Tiffany Flowers",
          style: TextStyle(color: Color(0xff73BFBD)),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 1,
              itemBuilder: (context, index) {
                return PageBuilderWidget(
                    title:  LocaleKeys.TIFFANYFLOWERSGUARANTEED.tr(),
                    description:LocaleKeys.Desc1.tr(),
                        
                    imgurl: "assets/images/introimg.jpg");
              }),
        
          Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.33,
                  child: Container(
                    width: 40.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Center(
                        child: Text(
                         LocaleKeys.GetStarted.tr(),
                          style: TextStyle(fontSize: 13.sp, color: Color(0xff73BFBD)),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.18,
            left: MediaQuery.of(context).size.width * 0.30,
            child: InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                showModalBottomSheet(
                  barrierColor: Colors.black.withOpacity(0.7),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  builder: (context) {
                    return CustomBottomSheet(
                      withHeader: false,
                      height: 30.h,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: LangWidget(
                          lg: context.locale.languageCode,
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 44.w,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Color.fromARGB(54, 158, 158, 158),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    LocaleKeys.ChooseLang.tr(),
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? Color(0xff73BFBD) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
          ),
          const SizedBox(
            height: 15,
          ),
          //Tite Text
          Text(title,
              style: TextStyle(
                  color: Color(0xffD8AA6B),
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          //discription
          Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff73BFBD),
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}

