import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderAppBar extends StatelessWidget {
   String title;
   void Function() myfc;
   OrderAppBar({
    required this.myfc,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.h,
      width: 100.w,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            // color: Colors.blue,
            //  height: 15.h,
            width: 100.w,
            child: Container()
          ),
          AppBar(
            
            title: InkWell(
              onTap: myfc,
              child: Text(
                
                title,
                style: TextStyle(color: Color(0xff73BFBD),fontSize:12.sp),
                
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff73BFBD),
              ),
              onPressed: myfc,
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
