import 'package:ecomerceapp/providers/IndexProvider.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'models/Category.dart';
import 'screens/CategoryDetailsScreen.dart';

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
      ],
         child: MaterialApp(
          theme: ThemeData(fontFamily: "Lucida Calligraphy"),
             title: 'Flutter Demo',
             
             initialRoute: '/',
             routes: {
          '/':(context)=>const HomeScreen(),
          '/categorydetails':(context)=> CategoryDetailsScreen(categories:[
                 
                  
                ],),
          
             },
           ),
       );
      }
 );
    
  }
}
