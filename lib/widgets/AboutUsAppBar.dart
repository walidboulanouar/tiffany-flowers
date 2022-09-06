import 'package:badges/badges.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutUsAppBar extends StatelessWidget {
  void Function()? fc;
  String name;
   AboutUsAppBar({
    required this.name,
    required this.fc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: 100.w,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            // color: Colors.blue,
            //  height: 15.h,
            width: 100.w,
          ),
          AppBar(
            title: Text(
              name,
              style: TextStyle(color: Color(0xff73BFBD), fontSize: 11.sp),
            ),
            titleSpacing: 26,
            leadingWidth: 20, // <-- Use this
            // <-- and this
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff73BFBD),
              ),
              onPressed:fc,
            ),
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Color.fromARGB(0, 250, 249, 249),
            
          )
        ],
      ),
    );
  }
}
