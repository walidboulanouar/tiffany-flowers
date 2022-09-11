import 'package:ecomerceapp/screens/AboutUs.dart';
import 'package:ecomerceapp/screens/Checkout.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:ecomerceapp/screens/WishListScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';

import '../models/Category.dart';
import '../providers/CartProvider.dart';
import '../providers/IndexProvider.dart';
import '../providers/OrderProvider.dart';
import '../providers/UserProvider.dart';
import '../providers/WishListProvider.dart';
import '../services/SqlService.dart';
import '../widgets/AccountAppBar.dart';
import '../widgets/CategoryAppBar.dart';
import '../widgets/DetailsAppBar.dart';
import 'ContactUs.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var sqlService = SqlService();
      UserProvider userProvider =
        Provider.of<UserProvider>(context);
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    WishListProvider wlProvider =
        Provider.of<WishListProvider>(context);
        CartProvider cartProvider = Provider.of<CartProvider>(context);
        OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          DetailsAppBar(
            myfc: () {
              indexProvider.setCurrentIndex(2);
            },
            title: "My Account",
          ),
          Flexible(
            child: ListView(

                // Remove padding
                padding: EdgeInsets.only(bottom: 10.h),
                children: [
                  // SizedBox(
                  //   height: 0.8.h,
                  // ),
                  // AccountAppBar(),
                  SizedBox(
                    height: 1.h,
                  ),
                  ListTile(
                    leading:  Image.asset("assets/images/Group 40338.png"),
                    
                    title: Text(
                      'Home',
                      style: TextStyle(fontSize: 11.sp),
                    ),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: (){
                       mainScreen.currentState!.popUntil((route) => route.isFirst);
                      indexProvider.setCurrentIndex(2);
                    },
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    selectedTileColor: Color(0xff73BFBD),
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/images/icon (2).svg"),
                    title: Text('My Orders', style: TextStyle(fontSize: 11.sp)),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: (){
                       orderScreen.currentState!.popUntil((route) => route.isFirst);
                      indexProvider.setCurrentIndex(0);
                    },
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    selectedTileColor: Color(0xff73BFBD),
                  ),
                  ListTile(
                   leading: SvgPicture.asset("assets/images/icon (3).svg"),
                    title:
                        Text('Categories', style: TextStyle(fontSize: 11.sp)),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: (){
                       categoriesScreen.currentState!.popUntil((route) => route.isFirst);
                      indexProvider.setCurrentIndex(1);
                    },
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    selectedTileColor: Color(0xff73BFBD),
                  ),
                  ListTile(
                    leading:
                    SvgPicture.asset("assets/images/icon (1).svg"),
                    
                    title: Text('My Cart', style: TextStyle(fontSize: 11.sp)),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: (){
                       cartScreen.currentState!.popUntil((route) => route.isFirst);
                      indexProvider.setCurrentIndex(4);
                    },
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    selectedTileColor: Color(0xff73BFBD),
                    trailing:  Container(
                      height:2.5.h,
                      width: 2.5.h,
                      child: Badge(
                        position: BadgePosition.topEnd(top: 2, end: -2),
                        toAnimate: false,
                        shape: BadgeShape.circle,
                        badgeColor: Color(0xffFF7171),
                        borderRadius: BorderRadius.circular(18),
                        badgeContent: FittedBox(
                          child: Text(
                            cartProvider.count.toString(),
                           
                            style: TextStyle(color: Colors.white, ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/images/icon (8).svg"),
                    title: Text('Wish List', style: TextStyle(fontSize: 11.sp)),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: () {
                       mainScreen.currentState!.popUntil((route) => route.isFirst);
                     mainScreen.currentState!.push(
                      
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              (WishListScreen(
                            
                           
                          )),
                        ),
                      );
                      indexProvider.setCurrentIndex(2);
                       
                    },
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    trailing: Container(
                      height:2.5.h,
                      width: 2.5.h,
                      child: Badge(
                        position: BadgePosition.topEnd(top: 2, end: -2),
                        toAnimate: false,
                        shape: BadgeShape.circle,
                        badgeColor: Color(0xffFF7171),
                        borderRadius: BorderRadius.circular(18),
                        badgeContent: FittedBox(
                          child: Text(
                            wlProvider.count.toString(),
                           
                            style: TextStyle(color: Colors.white, ),
                          ),
                        ),
                      ),
                    ),
                    selectedTileColor: Color(0xff73BFBD),
                  ),
                  ListTile(
                      leading: SvgPicture.asset("assets/images/icon (10).svg"),
                    title: Text(
                      'App Language',
                      style: TextStyle(fontSize: 11.sp),
                    ),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: () => null,
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    trailing: Container(
                      // width: 10.w,
                      // Image.asset("assets/images/ukflag.png"),
                      child: Text('English',
                          style: TextStyle(
                              fontSize: 9.sp, color: Color(0xff73BFBD))),
                    ),
                    selectedTileColor: Color(0xff73BFBD),
                  ),
                  ListTile(
                      leading: SvgPicture.asset("assets/images/icon (9).svg"),
                    title: Text('About', style: TextStyle(fontSize: 11.sp)),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUs()),
                      );
                    },
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    selectedTileColor: Color(0xff73BFBD),
                  ),
                  ListTile(
                      leading: SvgPicture.asset("assets/images/icon (5).svg"),
                    title: Text('Terms & Conditions',
                        style: TextStyle(fontSize: 11.sp)),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: () => () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Checkout()),
                      );
                    },
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    selectedTileColor: Color(0xff73BFBD),
                  ),
                  ListTile(
                      leading: SvgPicture.asset("assets/images/icon (6).svg"),
                    title: Text('Privacy Policy',
                        style: TextStyle(fontSize: 11.sp)),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: () => null,
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    selectedTileColor: Color(0xff73BFBD),
                  ),
                  ListTile(
                     leading: SvgPicture.asset("assets/images/icon (7).svg"),
                    title:
                        Text('Contact Us', style: TextStyle(fontSize: 11.sp)),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: () {
                      //  Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>  ContactUs()),
                      // );
                      
                    },
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    selectedTileColor: Color(0xff73BFBD),
                  ),
                   userProvider.user!=null?ListTile(
                    leading: SvgPicture.asset("assets/images/Iconly-Light-Outline-Logout.svg"),
                    // leading: Padding(
                    //   padding:  EdgeInsets.only(left: 4.sp),

                    //   child: ImageIcon(
                    //     size:15,
                    //     AssetImage("assets/images/Iconly-Light-Outline-Logout.svg"),
                    //     color: Color(0xff73BFBD),
                    //   ),
                    // ),
                    title: Text('Sign out',
                        style: TextStyle(fontSize: 11.sp)),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color.fromRGBO(216, 170, 107, 1),
                    onTap: () {
                      
                      sqlService.deleteUser( userProvider);

                      
                      orderProvider.removeOrders();
                       ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("You are log out"),
        duration: const Duration(seconds: 2),
      ),
    );
                      indexProvider.setCurrentIndex(2);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const Checkout()),
                      // );
                    },
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    selectedTileColor: Color(0xff73BFBD),
                  ):Container(),
                  SizedBox(
                    width: 100.h,
                    height: 3.h,
                  ),
                  Image.asset(
                    'assets/images/big-bang.png',
                    color: Color(0xff966F41),
                    width: 50,
                    height: 40,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
