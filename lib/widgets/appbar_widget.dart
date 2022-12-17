import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    iconTheme: IconThemeData(
        color: Colors
            .black), // set backbutton color here which will reflect in all screens.
    leading: BackButton(color: Color(0xff73BFBD),),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
