import 'package:ecomerceapp/providers/CartProvider.dart';
import 'package:ecomerceapp/providers/IndexProvider.dart';
import 'package:ecomerceapp/providers/LoadingProvider.dart';
import 'package:ecomerceapp/providers/WishListProvider.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/Category.dart';
import 'providers/BannerProvider.dart';
import 'providers/CategoriesProvider.dart';
import 'providers/OrderProvider.dart';
import 'providers/ProductProvider.dart';
import 'providers/UserProvider.dart';
import 'screens/CategoryDetailsScreen.dart';
import 'screens/SplashScreen.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return  Sizer(
      builder: (context, orientation, deviceType) {
       return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => IndexProvider()),
        ChangeNotifierProvider(create: (context) => CategoriesProvider()),
         ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => BannerProvider()),
        ChangeNotifierProvider(create: (context) => WishListProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => LoadingProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        
        
      ],
         child: MaterialApp(
          
          
          theme: ThemeData(fontFamily: "Lucida Calligraphy"),
             title: 'Flutter Demo',
             
             initialRoute: '/',
             routes: {
          '/':(context)=> const SplashScreen(),
          // '/categorydetails':(context)=> CategoryDetailsScreen(categories:[
                 
                  
          //       ],),
          
             },
           ),
       );
      }
 );
    
  }
}

