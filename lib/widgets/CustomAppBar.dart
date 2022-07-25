import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
            width: 100.w,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: 20.h,
            width: 100.w,
            child: Image.asset(
              'assets/images/appbarback.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding:  EdgeInsets.only(top:1.h, left: 5.w),
              child: Row(children: [
                Badge(
                  position: BadgePosition.topEnd(top: 3, end: -13),
                  toAnimate: false,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  badgeContent: Text(
                    "12",
                    style: TextStyle(color: Colors.white, fontSize: 4.sp),
                  ),
                  child: Container(
                    height: 8.w,
                    width: 8.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xff73BFBD)),
                    child: Center(
                      child: IconButton(
                        icon:
                            Icon(Icons.shopping_cart_outlined, size: 4.w),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w, right: 10.w),
                  child: CircleAvatar(
                    backgroundColor: Color(0xff73BFBD),
                    radius: 2.9.w,
                    child: IconButton(
                      icon: Icon(Icons.search,
                          size: 2.6.w, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 4.h),
                    height: 20.h,
                    width: 35.w,
                    child: Image.asset("assets/images/Logo.png")),
                    SizedBox(width: 10.w,),
                Badge(
                  position: BadgePosition.topEnd(top: 5, end: -22),
                  toAnimate: false,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  badgeContent: Text(
                    "12",
                    style: TextStyle(color: Colors.white, fontSize: 4.sp),
                  ),
                  
                      child: Container(
                        margin: EdgeInsets.only(bottom:20),
                        width:5.w,height:5.w,
                        child: IconButton(
                          icon:
                              Icon(Icons.favorite,size: 5.w,color: Color(0xff73BFBD)),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                   
                  
                ),
                SizedBox(width:5.w),
                Badge(
                  position: BadgePosition.topEnd(top: 5, end: -18),
                  toAnimate: false,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  badgeContent: Text(
                    "12",
                    style: TextStyle(color: Colors.white, fontSize: 4.sp),
                  ),
                   child: Container(
                    margin: EdgeInsets.only(bottom:20),
                        width:5.w,height:5.w,
                        child: IconButton(
                          icon:
                              Icon(Icons.notifications,size: 5.w,color: Color(0xff73BFBD)),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                ),
              ])),
        ],
      ),
    );
  }
}