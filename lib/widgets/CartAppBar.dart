import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CartAppBar

 extends StatelessWidget {
void Function() myfc;
   CartAppBar
  ({Key? key,required this.myfc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
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
            child: Image.asset(
              'assets/images/appbarback.png',
              fit: BoxFit.fill,
            ),
          ),
          AppBar(
            title: InkWell(
              onTap: myfc,
              child: Text(
                
                'Cart',
                style: TextStyle(color: Color(0xff73BFBD),fontSize:10.sp),
                
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff73BFBD),
              ),
              onPressed: myfc
            ),
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Color.fromARGB(0, 250, 249, 249),
            actions: [
              
                SizedBox(width: 8.w,),
                
                Badge(
                  position: BadgePosition.topEnd(top: 9, end: -17),
                  toAnimate: false,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  badgeContent: Text(
                    "12",
                    style: TextStyle(color: Colors.white, fontSize: 4.3.sp),
                  ),
                  
                      child: Container(
                        margin: EdgeInsets.only(bottom:20),
                        width:5.w,height:5.w,
                        child: IconButton(
                          icon:
                              Icon(Icons.notifications,size: 15.sp,color: Color(0xff73BFBD)),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                   
                  
                ),
                SizedBox(width: 10.w,)
            ],
          )
        ],
      ),
    );
  }
}