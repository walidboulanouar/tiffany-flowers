import 'package:ecomerceapp/screens/AccountScreen.dart';
import 'package:ecomerceapp/screens/CartScreen.dart';
import 'package:ecomerceapp/screens/CategoriesScreen.dart';
import 'package:ecomerceapp/screens/MainScreen.dart';
import 'package:ecomerceapp/screens/OrdersScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../models/Category.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _children = [
    OrdersScreen(),
    CategoriesScreen(categories: [
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
                    Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
                Category(
                    image: "assets/images/bouket.jpg", title: "Hand Bouket"),
              ]),
    MainScreen(),
    AccountScreen(),
    CartScreen()
    
  ];
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      floatingActionButton:GestureDetector(
        onTap:
            () {
          _onItemTapped(2);
        },
        child: Container(
                height: 15.h,
                width: 12.w,
                child: 
                Image.asset("assets/images/homelogo.png"),
                ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: 
       BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 5.sp,
      unselectedFontSize: 5.sp,

      showUnselectedLabels: true,
      unselectedItemColor: Color(0xff73BFBD),
      selectedItemColor:Color(0xffD8AA6B),
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'ORDERS',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'CATEGORIES',
            backgroundColor:Colors.white
          ),
          BottomNavigationBarItem(
            icon: Container(height:15.sp),
            label: 'HOME',
            backgroundColor:Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'ACCOUNT',
            backgroundColor:Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'cart',
            backgroundColor: Colors.white
          ),
        ],
        currentIndex: _selectedIndex,

        onTap: _onItemTapped,
      ),
      extendBodyBehindAppBar: true,
      body: _children[_selectedIndex],
    );
  }
}


