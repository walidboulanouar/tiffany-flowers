import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderAppBar extends StatelessWidget {
   
   OrderAppBar({
    
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
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
            title: Text(
              
              'My Orders',
              style: TextStyle(color: Color(0xff73BFBD),fontSize:10.sp),
              
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff73BFBD),
              ),
              onPressed: () {},
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
