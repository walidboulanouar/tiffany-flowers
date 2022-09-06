import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:ecomerceapp/widgets/AboutUsAppBar.dart';
import 'package:ecomerceapp/widgets/TextTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';

import '../widgets/AboutUsAppBar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

          // Remove padding
          
          children: [
            AboutUsAppBar(name: "Contact Us",fc: (){
              accountScreen.currentState!.pop();
            },),
          
          
           
          ]),
    );
  }
}
