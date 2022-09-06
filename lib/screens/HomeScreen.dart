import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecomerceapp/screens/AccountScreen.dart';
import 'package:ecomerceapp/screens/CartScreen.dart';
import 'package:ecomerceapp/screens/CategoriesScreen.dart';
import 'package:ecomerceapp/screens/MainScreen.dart';
import 'package:ecomerceapp/screens/OrdersScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:sizer/sizer.dart';

import '../models/Category.dart';

import '../providers/CategoriesProvider.dart';
import '../providers/IndexProvider.dart';
import '../providers/UserProvider.dart';
import '../providers/WishListProvider.dart';
import '../services/Services.dart';
import '../services/SqlService.dart';
import 'CategoryDetailsScreen.dart';
import 'LoginScreen.dart';

final orderScreen = GlobalKey<NavigatorState>();
final categoriesScreen = GlobalKey<NavigatorState>();
final mainScreen = GlobalKey<NavigatorState>();
final accountScreen = GlobalKey<NavigatorState>();
final cartScreen = GlobalKey<NavigatorState>();


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
    UserProvider userProvider = Provider.of<UserProvider>(context,listen: false);
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
        if(val==0){
          print(val);
      _pages.removeAt(0);
      _pages.insert(0, OrdersScreen(key: UniqueKey()));
       pv.setCurrentIndex(val);
       if(userProvider.user == null){
             AwesomeDialog(
                                  btnOkText: "Sign In",
                                  context: context,
                                  dialogType: DialogType.WARNING,
                                  animType: AnimType.RIGHSLIDE,
                                  title: 'Sign In Required',
                                  desc: 'This Action Require Sign in ',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    // orderScreen.currentState!.push(
                                    //     MaterialPageRoute(
                                    //       builder: (context) => LoginScreen(orderScreen)),
                                    // );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen(orderScreen)),
                                    );
                                  },
                                ).show();
          }
      // setState(() => pageIndex = index
      // );
    }
        pv.setCurrentIndex(val);
      }
    }
  }
  
  List<Widget> _pages=[
          Navigator(
            key: orderScreen,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => 
              // userProvider.user != null
              //     ? 
                  OrdersScreen()
                  // : OrdersScreen(id: -1,),
            ),
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

  void _onItemTapped(int index, IndexProvider pv) {
    print("index");
    print(index);
    if(index==0){
      _pages.removeAt(0);
      _pages.insert(0, CartScreen());
       pv.setCurrentIndex(index);
      // setState(() => pageIndex = index
      // );
    }
    pv.setCurrentIndex(index);

  }

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    CategoriesProvider categoriesProvider =
        Provider.of<CategoriesProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    // print(userProvider.user!.email!+" zabbbbb");
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
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
              icon: ImageIcon(AssetImage("assets/images/categoryicon.png")),
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
        onTap: (val) => _onTap(val, context, indexProvider),
      ),
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        index: indexProvider.currentIndex,
        children: _pages,
      ),
    );
  }
}
