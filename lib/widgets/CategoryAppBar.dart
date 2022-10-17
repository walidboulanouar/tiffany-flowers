import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/CartProvider.dart';
import '../providers/IndexProvider.dart';
import '../screens/HomeScreen.dart';

class CategoryAppBar extends StatelessWidget {
  String title;
  void Function() myfc;
   CategoryAppBar({
    required this.myfc,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
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
            child: Image.asset(
              'assets/images/appbarback.png',
              fit: BoxFit.fill,
            ),
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
            actions: [
              // Badge(
              //     position: BadgePosition.topEnd(top: 7, end: -9),
              //     toAnimate: false,
              //     shape: BadgeShape.circle,
              //     badgeColor: Colors.red,
              //     borderRadius: BorderRadius.circular(8),
              //     badgeContent: Text(
              //       "0",
              //       style: TextStyle(color: Colors.white, fontSize: 4.sp),
              //     ),
                  
              //         child: Container(
              //           margin: EdgeInsets.only(bottom:20),
              //           width:7.w,height:7.w,
              //           child: IconButton(
              //             icon:
              //                 Icon(Icons.notifications,size: 15.sp,color: Color(0xff73BFBD)),
              //             onPressed: () {},
              //             color: Colors.white,
              //           ),
              //         ),
                   
                  
              //   ),
                SizedBox(width: 8.w,),
                
                Badge(
                  position: BadgePosition.topEnd(top: -1, end: -11),
                  toAnimate: false,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  badgeContent:Padding(
                    padding: const EdgeInsets.all(0.5),
                    child: Text(
                        
                       cartProvider.count.toString(),
                        style: TextStyle(
                          
                          color: Colors.white, fontSize: 8.sp),
                      ),
                  ),
                  
                
                   child: Container(
                    margin: EdgeInsets.only(bottom:20),
                        width:7.w,height:7.w,
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
