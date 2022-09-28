import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart'  hide TextDirection;

import 'package:ecomerceapp/screens/AccountScreen.dart';
import 'package:ecomerceapp/screens/CartScreen.dart';
import 'package:ecomerceapp/screens/CategoriesScreen.dart';
import 'package:ecomerceapp/screens/MainScreen.dart';
import 'package:ecomerceapp/screens/OrdersScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';



import '../providers/CategoriesProvider.dart';
import '../providers/IndexProvider.dart';
import '../providers/UserProvider.dart';

import '../services/Services.dart';

import '../translations/locale_keys.g.dart';

import 'RegistrationScreen.dart';

var orderScreen = GlobalKey<NavigatorState>();
final categoriesScreen = GlobalKey<NavigatorState>();
final mainScreen = GlobalKey<NavigatorState>();
final accountScreen = GlobalKey<NavigatorState>();
final cartScreen = GlobalKey<NavigatorState>();
 List<Widget> pages = [
    Navigator(
      key: orderScreen,
      onGenerateRoute: (route) => MaterialPageRoute(
          settings: route,
          builder: (context) => OrdersScreen(
                key: UniqueKey(),
              )),
    ),
    Navigator(
      key: categoriesScreen,
      onGenerateRoute: (route) => MaterialPageRoute(
        settings: route,
        builder: (context) => CategoriesScreen(
          categoriesScreen: categoriesScreen,
        ),
      ),
    ),
    Navigator(
      key: mainScreen,
      onGenerateRoute: (route) => MaterialPageRoute(
        settings: route,
        builder: (context) => MainScreen(),
      ),
    ),
    Navigator(
      key: accountScreen,
      onGenerateRoute: (route) => MaterialPageRoute(
        settings: route,
        builder: (context) => AccountScreen(),
      ),
    ),
    Navigator(
      key: cartScreen,
      onGenerateRoute: (route) => MaterialPageRoute(
        settings: route,
        builder: (context) => CartScreen(),
      ),
    ),
  ];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // var sqlService = SqlService();
    // UserProvider userProvider =
    //     Provider.of<UserProvider>(context, listen: false);

    // sqlService.getUser(userProvider);
    CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    getCategories(categoriesProvider);
  }

  void _onTap(int val, BuildContext context, IndexProvider pv) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    if (pv.currentIndex == val) {
      switch (val) {
        case 0:
          orderScreen.currentState!.popUntil((route) => route.isFirst);

          // Restart.restartApp();
          break;
        case 1:
          categoriesScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        case 2:
          mainScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        case 3:
          accountScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        case 4:
          cartScreen.currentState!.popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      if (mounted) {
        if (val == 0) {
          setState(() {
            orderScreen = GlobalKey<NavigatorState>();
          });
          pages.removeAt(0);
          pages.insert(
            0,
            Navigator(
              key: orderScreen,
              onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) =>
                      // userProvider.user != null
                      //     ?
                      OrdersScreen(
                        key: UniqueKey(),
                      )
                  // : OrdersScreen(id: -1,),
                  ),
            ),
          );
          pv.setCurrentIndex(val);
          if (userProvider.user == null) {
            AwesomeDialog(
              btnCancelText: LocaleKeys.Cancel.tr(),
              btnOkText: LocaleKeys.SignIn.tr(),
              context: context,
              titleTextStyle: TextStyle(
                color: Color(0xff73BFBD),
              ),
              descTextStyle: TextStyle(
                color: Color(0xffD8AA6B),
              ),
              buttonsTextStyle: TextStyle(fontSize: 8.sp),
              btnOkColor: Color(0xff73BFBD),
              btnCancelColor: Color(0xffD8AA6B),
              dialogType: DialogType.WARNING,
              animType: AnimType.RIGHSLIDE,
              title:LocaleKeys.SignInRequired.tr(),
              desc:LocaleKeys.ThisActionRequire.tr(),
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegistrationScreen(cartScreen)),
                );
              },
            ).show();
          }
         
        }
        pv.setCurrentIndex(val);
      }
    }
  }

 

  
  DateTime? currentBackPressTime;
  Future<bool> onWillPop(IndexProvider indexProvider) {
    DateTime now = DateTime.now();
    switch (indexProvider.currentIndex) {
      case 0:
        
        orderScreen.currentState!.canPop()
            ? orderScreen.currentState!.pop()
            : indexProvider.setCurrentIndex(2);
        break;
      case 1:
        categoriesScreen.currentState!.canPop()
            ? categoriesScreen.currentState!.pop()
            : indexProvider.setCurrentIndex(2);
        break;
      case 2:
        mainScreen.currentState!.canPop()
            ? mainScreen.currentState!.pop()
            : indexProvider.setCurrentIndex(2);
        break;
      case 3:
        accountScreen.currentState!.canPop()
            ? accountScreen.currentState!.pop()
            : indexProvider.setCurrentIndex(2);
        break;
      case 4:
        cartScreen.currentState!.canPop()
            ? cartScreen.currentState!.pop()
            : indexProvider.setCurrentIndex(2);
        break;
      default:
    }
    if (indexProvider.currentIndex == 2 && !mainScreen.currentState!.canPop()) {
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;

        return Future.value(false);
      }
      return Future.value(true);
      //  return true;
    } else {
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    // 

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return WillPopScope(
      onWillPop: () => onWillPop(indexProvider),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: GestureDetector(
          onTap: () {
            _onTap(2, context, indexProvider);
          },
          child: Container(
            height: 15.h,
            width: 12.w,
            child: Image.asset("assets/images/homelogo.png"),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.ltr,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 5.sp,
            unselectedFontSize: 5.sp,
            showUnselectedLabels: true,
            unselectedItemColor: Color(0xff73BFBD),
            selectedItemColor: Color(0xffD8AA6B),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded),
                label: LocaleKeys.ORDERS.tr(),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: SvgPicture.asset(
                        color: indexProvider.currentIndex == 1
                            ? Color(0xffD8AA6B)
                            : Color(0xff73BFBD),
                        "assets/images/icon (3).svg"),
                  ),
                  label: LocaleKeys.CATEGORIES.tr(),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Container(height: 15.sp),
                  label: LocaleKeys.HOME.tr(),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined),
                  label:LocaleKeys.ACCOUNT.tr(),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: LocaleKeys.CART.tr(),
                  backgroundColor: Colors.white),
            ],
            currentIndex: indexProvider.currentIndex,
            onTap: (val) => _onTap(val, context, indexProvider),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: IndexedStack(
          index: indexProvider.currentIndex,
          children: pages,
        ),
      ),
    );
  }
}
