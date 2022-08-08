import 'package:ecomerceapp/screens/AboutUs.dart';
import 'package:ecomerceapp/screens/Checkout.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:ecomerceapp/screens/WishListScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';

import '../models/Category.dart';
import '../providers/IndexProvider.dart';
import '../widgets/AccountAppBar.dart';
import '../widgets/CategoryAppBar.dart';
import '../widgets/DetailsAppBar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
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
                padding: EdgeInsets.zero,
                children: [
                  // SizedBox(
                  //   height: 0.8.h,
                  // ),
                  // AccountAppBar(),
                  SizedBox(
                    height: 1.h,
                  ),
                  ListTile(
                    leading: Image.asset("assets/images/Group 40338.png"),
                    //  ImageIcon(
                    //   AssetImage("assets/images/Group 40338.png"),
                    //   color: Color(0xff73BFBD),
                    // ),
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
                    leading: ImageIcon(
                      AssetImage("assets/images/Group 38731.png"),
                      color: Color(0xff73BFBD),
                    ),
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
                    leading: ImageIcon(
                      AssetImage("assets/images/Group 40337.png"),
                      color: Color(0xff73BFBD),
                    ),
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
                    leading: ImageIcon(
                      AssetImage("assets/images/Group 43.png"),
                      color: Color(0xff73BFBD),
                    ),
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
                    trailing: Badge(
                      position: BadgePosition.topEnd(top: 2, end: -2),
                      toAnimate: false,
                      shape: BadgeShape.circle,
                      badgeColor: Color(0xffFF7171),
                      borderRadius: BorderRadius.circular(18),
                      badgeContent: Text(
                        "12",
                        style: TextStyle(color: Colors.white, fontSize: 8.sp),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/images/Icon awesome-heart.png"),
                      color: Color(0xff73BFBD),
                    ),
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
                            categories: [
                              Category(
                                id: 1,
                                  image: "assets/images/bouket3.jfif",
                                  name: "Hand Bouket"),
                              Category(
                                id:2,
                                  image: "assets/images/bouket3.jfif",
                                  name: "Hand Bouket"),
                              
                            ],
                           
                          )),
                        ),
                      );
                      indexProvider.setCurrentIndex(2);
                       
                    },
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    trailing: Badge(
                      position: BadgePosition.topEnd(top: 2, end: -2),
                      toAnimate: false,
                      shape: BadgeShape.circle,
                      badgeColor: Color(0xffFF7171),
                      borderRadius: BorderRadius.circular(18),
                      badgeContent: Text(
                        "12",
                        style: TextStyle(color: Colors.white, fontSize: 8.sp),
                      ),
                    ),
                    selectedTileColor: Color(0xff73BFBD),
                  ),
                  ListTile(
                    leading: ImageIcon(
                      AssetImage(
                          "assets/images/3844474_gear_setting_settings_wheel_icon.png"),
                      color: Color(0xff73BFBD),
                    ),
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
                    leading: ImageIcon(
                      AssetImage(
                          "assets/images/Icon material-info-outline.png"),
                      color: Color(0xff73BFBD),
                    ),
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
                    leading: ImageIcon(
                      AssetImage("assets/images/Group 40340.png"),
                      color: Color(0xff73BFBD),
                    ),
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
                    leading: ImageIcon(
                      AssetImage("assets/images/Group 40342.png"),
                      color: Color(0xff73BFBD),
                    ),
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
                    leading: ImageIcon(
                      AssetImage("assets/images/Group 40344.png"),
                      color: Color(0xff73BFBD),
                    ),
                    title:
                        Text('Contact Us', style: TextStyle(fontSize: 11.sp)),
                    minLeadingWidth: 5,
                    contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                    textColor: Color(0xffD8AA6B),
                    onTap: () => null,
                    hoverColor: Color(0xff73BFBD),
                    dense: true,
                    selectedTileColor: Color(0xff73BFBD),
                  ),
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
