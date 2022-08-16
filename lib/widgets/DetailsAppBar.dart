import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/CartProvider.dart';
import '../providers/IndexProvider.dart';
import '../screens/HomeScreen.dart';

class DetailsAppBar extends StatelessWidget {
  String title;
  void Function() myfc;
   DetailsAppBar({
    required this.myfc,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      height: 15.h,
      width: 100.w,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          
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
            actions: [
              Badge(
                  position: BadgePosition.topEnd(top: 9, end: -17),
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
                              Icon(Icons.notifications,size: 15.sp,color: Color(0xff73BFBD)),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                   
                  
                ),
                SizedBox(width: 8.w,),
                
                Badge(
                  position: BadgePosition.topEnd(top: 7, end: -16),
                  toAnimate: false,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  badgeContent: Container(
                     height: 5.sp,
                    width: 5.sp,
                    child: FittedBox(
                      child: Text(
                        cartProvider.count.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                    ),
                  ),
                   child: Container(
                    margin: EdgeInsets.only(bottom:20),
                        width:5.w,height:5.w,
                        child: IconButton(
                          icon:
                              Icon(Icons.shopping_cart_outlined,size: 15.sp,color: Color(0xff73BFBD)),
                          onPressed: () {
                                cartScreen.currentState!.popUntil((route) => route.isFirst);
                      indexProvider.setCurrentIndex(4);
                          },
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
