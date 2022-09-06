import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:ecomerceapp/widgets/AboutUsAppBar.dart';
import 'package:ecomerceapp/widgets/TextTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';

import '../widgets/AboutUsAppBar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

          // Remove padding
          
          children: [
            AboutUsAppBar(name: "About Us",fc: (){
              accountScreen.currentState!.pop();
            },),
          Flexible(
            child: ListView(
              padding: EdgeInsets.only(top: 0.0,bottom: 5.sp),
              children: [
               Container(
                    padding: EdgeInsets.only(top: 20.0),
                    height: 30.h,
                    width: 24.w,
                    child: Image.asset("assets/images/homelogo.png"),
                  ),
                  SizedBox(
                    height: 0.2.h,
                  ),
                  Text(
                    "About Us",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffD8AA6B),
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    
                    
                    '''
Tiffany Flowers is no ordinary florist.
                               
Founded in 2014, it is one of the most creative floral 
design companies in the United Arab Emirates.
                         
Our extensive experience, talented staff vision and 
imagination add to a unique and beautiful service. 
                       
Our talented team has more experience in flower 
arrangement and event management.
                       
Tiffany Flowers aims to present something beautiful, 
 and unique, something a little different for 
your wedding day, event or even everyday flowers for 
your loved ones. We specialize in providing amazing 
flowers with our creative touch.
                       
Tiffany Flowers can weave its magic on all occasions
from weddings, corporate functions, events, parties 
and everyday flowers. We turn bridal visions into 
reality, add style to company events or simply 
reception desk arrangements, we can create a single 
center table or arrange a design or theme for a 
party for 1000 guests or a simple package for
your home or family.
                    ''',
                    
                    maxLines: 30,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      
                      
                      color: Color(0xff73BFBD),
                      fontSize: 11,
                    ),
                  ),
            ],),
          )
           
          ]),
    );
  }
}
