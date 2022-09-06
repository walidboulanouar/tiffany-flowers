import 'package:badges/badges.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:ecomerceapp/screens/VerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../services/Services.dart';

class LoginScreen extends StatefulWidget {
   GlobalKey<NavigatorState> screen;
   LoginScreen(this.screen);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
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

  final _formKey = GlobalKey<FormState>();
   String? _phone;
   String? _email;
   String? _firstName;
   String? _lastName;
  @override
  Widget build(BuildContext context) {
   
    print (_phone);
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
      height: 15.h,
      width: 100.w,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
        
          Container(
            // color: Colors.blue,
            //  height: 15.h,
            width: 100.w,
            child: Image.asset(
              'assets/images/appbarback.png',
              fit: BoxFit.fill,
            ),
          ),
          AppBar(
            title: InkWell(
              onTap: (){},
              child: Text(
                
                'Sign In',
                style: TextStyle(color: Color(0xff73BFBD),fontSize:10.sp),
                
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff73BFBD),
              ),
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Color.fromARGB(0, 250, 249, 249),
          
          )
        ],
      ),
        )
        ,  
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.only(bottom: 10.sp),
                            width: 200,
                            height: 150,
                            /*decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50.0)),*/
                            child: Image.asset('assets/images/Logo.png')),
                      ),
                    ),
                    Container(
                      margin:  EdgeInsets.only(left:15.0,right: 15.0,top:5,bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        validator: validateName,
                        keyboardType: TextInputType.phone,
                        onSaved: (String? val) {
                          setState(() {
                            _firstName = val;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'First Name',
                            hintText: 'Enter your first name'),
                      ),
                    ),Container(
                      margin:  EdgeInsets.only(left:15.0,right: 15.0,top:5,bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        validator: validateName,
                        keyboardType: TextInputType.phone,
                        onSaved: (String? val) {
                          setState(() {
                            _lastName = val;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Last Name',
                            hintText: 'Enter Your last name'),
                      ),
                    ),Container(
                      margin:  EdgeInsets.only(left:15.0,right: 15.0,top:5,bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        validator: validateEmail,
                        keyboardType: TextInputType.phone,
                        onSaved: (String? val) {
                          setState(() {
                            _email = val;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'example@gmail.com'),
                      ),
                    ),
                    Container(
                      margin:  EdgeInsets.only(left:15.0,right: 15.0,top:5,bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        validator: validateMobile,
                        keyboardType: TextInputType.phone,
                        onSaved: (String? val) {
                          setState(() {
                            _phone = val;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'phone number',
                            hintText: '+212xxxxxx'),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      margin: EdgeInsets.only(top: 30.sp),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(Color(0xff73BFBD)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                             _formKey.currentState!.save();
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(content: Text('Processing Data')),
                            // );
                            register(_phone!,_email!,_firstName!,_lastName!);
            
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VerificationScreen(phoneNumber: _phone, screen: widget.screen,)),
                                );
                          }
                          // Navigator.push(
                          //     context, MaterialPageRoute(builder: (_) => HomeScreen()));
                        },
                        child: Text(
                          'Send',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
