import 'package:ecomerceapp/screens/AccountScreen.dart';
import 'package:ecomerceapp/screens/CartScreen.dart';
import 'package:ecomerceapp/screens/CategoriesScreen.dart';
import 'package:ecomerceapp/screens/MainScreen.dart';
import 'package:ecomerceapp/screens/OrdersScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/Category.dart';

import '../providers/IndexProvider.dart';
import 'CategoryDetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    final _orderScreen = GlobalKey<NavigatorState>();
  final categoriesScreen = GlobalKey<NavigatorState>();
  final _mainScreen = GlobalKey<NavigatorState>();
  final _accountScreen = GlobalKey<NavigatorState>();
  final _cartScreen = GlobalKey<NavigatorState>();
  void _onTap(int val, BuildContext context,IndexProvider pv) {
    if (pv.currentIndex == val) {
      switch (val) {
        case 0:
          _orderScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        case 1:
          categoriesScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        case 2:
          _mainScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        case 3:
          _accountScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        case 3:
          _cartScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      if (mounted) {
        pv.setCurrentIndex(val);
        // setState(() {
        //   _selectedIndex = val;
        // });
      }
    }
  }


  // int _selectedIndex = 2;
  void _onItemTapped(int index,IndexProvider pv) {
    pv.setCurrentIndex(index);
    
    // setState(() {
    //   _selectedIndex = index;
    // });
    
  }

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
         _onTap(2, context,indexProvider);
        },
        child: Container(
          height: 15.h,
          width: 12.w,
          child: Image.asset("assets/images/homelogo.png"),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 5.sp,
        unselectedFontSize: 5.sp,
        showUnselectedLabels: true,
        unselectedItemColor: Color(0xff73BFBD),
        selectedItemColor: Color(0xffD8AA6B),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'ORDERS',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'CATEGORIES',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Container(height: 15.sp),
              label: 'HOME',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'ACCOUNT',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'cart',
              backgroundColor: Colors.white),
        ],
        currentIndex: indexProvider.currentIndex,
        onTap: (val) => _onTap(val, context,indexProvider),
      ),
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        index: indexProvider.currentIndex,
        children: <Widget>[
          Navigator(
            key: _orderScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => OrdersScreen(),
            ),
          ),
          Navigator(
            key: categoriesScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) =>  CategoriesScreen(
      categoriesScreen: categoriesScreen,
      categories: [
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
            ),
          ),
          Navigator(
            key: _mainScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => MainScreen(),
            ),
          ),
          Navigator(
            key: _accountScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => AccountScreen(),
            ),
          ),
          Navigator(
            key: _cartScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => CartScreen(),
            ),
          ),
        ],
      ),
      // ValueListenableBuilder(
      //     valueListenable: children,
      //     builder: (_, child, __) {
      //       return children.value.elementAt(_selectedIndex);
      //     }),
      // children[_selectedIndex],
    );
  }
}



