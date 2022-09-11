import 'package:badges/badges.dart';
import 'package:dio/dio.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:ecomerceapp/screens/VerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:sizer/sizer.dart';

import '../services/Services.dart';

class RegistrationScreen extends StatefulWidget {
  GlobalKey<NavigatorState> screen;
  RegistrationScreen(this.screen);
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? validateMobile(String? value) {
    String patttern =
        r'(^\+((?:9[679]|8[035789]|6[789]|5[90]|42|3[578]|2[1-689])|9[0-58]|8[1246]|6[0-6]|5[1-8]|4[013-9]|3[0-469]|2[70]|7|1)(?:\W*\d){0,13}\d$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.trim().length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validateEmail(String? value) {
    String patttern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+"
        ;
    RegExp regExp = new RegExp(patttern);
    if (value!.trim().length == 0) {
      return 'Please enter an email address';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid email address';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.trim().length == 0) {
      return 'Please enter your name';
    }
    return null;
  }

  int _tabTextIndexSelected = 0;
  List<String> _listTextTabToggle = ["Login", "Sign Up"];

  final _formKey = GlobalKey<FormState>();
  String? _phone;
  String? _email;
  String? _firstName;
  String? _lastName;
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    print(_phone);
    return Scaffold(
        resizeToAvoidBottomInset: false,

        // backgroundColor: Color(0xff73BFBD),
        body: Stack(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              // decoration: BoxDecoration(),
              color: Color(0xff73BFBD),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SizedBox(height: 20.h,),
                Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Center(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10.sp),
                        width: 30.w,
                        height: 15.h,
                        /*decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset('assets/images/homelogo.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: FlutterToggleTab(
                    isShadowEnable: false,
                      
                    unSelectedBackgroundColors: [Colors.transparent],
                      
                    // width in percent
                      
                    width: 14.w,
                      
                    borderRadius: 100,
                      
                    height: 4.h,
                      
                    selectedIndex: _tabTextIndexSelected,
                      
                    selectedBackgroundColors: [Colors.transparent],
                      
                    selectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                      
                    unSelectedTextStyle: TextStyle(
                        color: Color.fromARGB(118, 255, 255, 255),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                      
                    labels: _listTextTabToggle,
                      
                    selectedLabelIndex: (index) {
                      setState(() {
                        _tabTextIndexSelected = index;
                      });
                      
                      //  orderScreen.currentState!.initState();
                    },
                      
                    isScroll: false,
                  ),
                ),
                Container(
                    // height: 70.h,
                    child: (() {
                  if (_tabTextIndexSelected == 0) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 10.h,
                            margin: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5, bottom: 5),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              focusNode: myFocusNode,
                              validator: validateMobile,
                              keyboardType: TextInputType.phone,
                              onSaved: (String? val) {
                                setState(() {
                                  _phone = val;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffD8AA6B))),
                                  // label: Text("phone number"),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffD8AA6B))),
                                  errorStyle:
                                      TextStyle(color: Color(0xffD8AA6B)),
                                  labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.white
                                          : Colors.white),
                                  labelText: 'phone number',
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: '+971 xxx xxx xxx'),
                            ),
                          ),
                          Container(
                            height: 5.h,
                            width: 30.w,
                            margin: EdgeInsets.only(top: 30.sp),
                            decoration: BoxDecoration(
        
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(50)),
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: Colors.white))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                 showGeneralDialog(
                              context: context,
                              barrierDismissible: false,
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return SafeArea(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    padding: EdgeInsets.all(20),
                                    color: Colors.transparent,
                                    child: Center(
                                      child: SpinKitWave(
                                        // duration: const Duration(seconds: 10),
                                        color: Color(0xff73BFBD),
                                        size: 50.0,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                                 Response response=await login(_phone!
                                      );
                                      if (!(response.statusCode == 409)) {
                              
                              Navigator.of(context, rootNavigator: true)
                                      .canPop()
                                  ? Navigator.of(context, rootNavigator: true)
                                      .pop()
                                  : null;
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VerificationScreen(
                                              phoneNumber: _phone,
                                              screen: widget.screen,
                                            )),
                                  );

                              

                            } else {
                             
                              Navigator.of(context, rootNavigator: true)
                                      .canPop()
                                  ? Navigator.of(context, rootNavigator: true)
                                      .pop()
                                  : null;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Color(0xffD8AA6B),
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      "user doesn't exists",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              
                            }
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           VerificationScreen(
                                  //             phoneNumber: _phone,
                                  //             screen: widget.screen,
                                  //           )),
                                  // );
                                }
                                // Navigator.push(
                                //     context, MaterialPageRoute(builder: (_) => HomeScreen()));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Color(0xff73BFBD), fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (_tabTextIndexSelected == 1) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 3.h,),
                          Container(
                            margin: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5, bottom: 10.sp),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              validator: validateName,
                              keyboardType: TextInputType.name,
                              onSaved: (String? val) {
                                setState(() {
                                  _firstName = val;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffD8AA6B))),
                                // label: Text("phone number"),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffD8AA6B))),
                                errorStyle: TextStyle(color: Color(0xffD8AA6B)),
                                labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.white),
                    
                                labelText: 'First Name',
                                hintText: 'Enter your first name',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5, bottom: 10.sp),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              validator: validateName,
                              keyboardType: TextInputType.name,
                              onSaved: (String? val) {
                                setState(() {
                                  _lastName = val;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffD8AA6B))),
                                  // label: Text("phone number"),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffD8AA6B))),
                                  errorStyle:
                                      TextStyle(color: Color(0xffD8AA6B)),
                                  labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.white
                                          : Colors.white),
                                  hintStyle: TextStyle(color: Colors.white),
                                  labelText: 'Last Name',
                                  hintText: 'Enter Your last name'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5, bottom: 10.sp),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              validator: validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (String? val) {
                                setState(() {
                                  _email = val;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffD8AA6B))),
                                // label: Text("phone number"),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffD8AA6B))),
                                errorStyle: TextStyle(color: Color(0xffD8AA6B)),
                                labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.white),
                    
                                labelText: 'Email',
                                hintText: 'example@gmail.com',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5, bottom: 0.sp),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              validator: validateMobile,
                              keyboardType: TextInputType.phone,
                              onSaved: (String? val) {
                                setState(() {
                                  _phone = val;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffD8AA6B))),
                                  // label: Text("phone number"),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffD8AA6B))),
                                  errorStyle:
                                      TextStyle(color: Color(0xffD8AA6B)),
                                  labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? Colors.white
                                          : Colors.white),
                                  labelText: 'phone number',
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: '+971 xxx xxx xxx'),
                            ),
                          ),
                           Container(
                            height: 5.h,
                            width: 30.w,
                            margin: EdgeInsets.only(top: 20.sp),
                            decoration: BoxDecoration(
                    
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(50)),
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: Colors.white))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  showGeneralDialog(
                              context: context,
                              barrierDismissible: false,
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return SafeArea(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    padding: EdgeInsets.all(20),
                                    color: Colors.transparent,
                                    child: Center(
                                      child: SpinKitWave(
                                        // duration: const Duration(seconds: 10),
                                        color: Color(0xff73BFBD),
                                        size: 50.0,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                                   Response response = await register(_phone!, _email!, _firstName!,
                                      _lastName!);
                    

                    if (!(response.statusCode == 409)) {
                              
                              Navigator.of(context, rootNavigator: true)
                                      .canPop()
                                  ? Navigator.of(context, rootNavigator: true)
                                      .pop()
                                  : null;
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VerificationScreen(
                                              phoneNumber: _phone,
                                              screen: widget.screen,
                                            )),
                                  );

                              

                            } else {
                             
                              Navigator.of(context, rootNavigator: true)
                                      .canPop()
                                  ? Navigator.of(context, rootNavigator: true)
                                      .pop()
                                  : null;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Color(0xffD8AA6B),
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      "User Already exists with this phone number",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              
                            }
                                 
                                }
                               
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Color(0xffD8AA6B), fontSize: 10.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }())),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 0.h),
                child: Center(
                  child: FittedBox(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10.sp),
                        width: 40.w,
                        height: 20.h,
                        /*decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50.0)),*/
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset(
                              color:Color.fromARGB(148, 246, 246, 246),
                                'assets/images/orginaltop.png'))),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 7.h),
                child: Center(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 10.sp),
                      width: 40.w,
                      height: 20.h,
                      /*decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50.0)),*/
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                            color:Color.fromARGB(148, 246, 246, 246),
                              'assets/images/orginalbottom.png'))),
                ),
              ),
            )
          ],
        ));
  }
}
