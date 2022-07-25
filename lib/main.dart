import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
       return MaterialApp(
        theme: ThemeData(fontFamily: "Lucida Calligraphy"),
      title: 'Flutter Demo',
      
      initialRoute: '/',
      routes: {
        '/':(context)=>const HomeScreen(),
        
      },
    );
      }
 );
    
  }
}

