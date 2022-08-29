import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/User.dart';
import '../providers/UserProvider.dart';
import '../services/Services.dart';
import '../services/SqlService.dart';

class VerificationScreen extends StatefulWidget {
  final String? phoneNumber;

  const VerificationScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _VerificationScreenState createState() =>
      _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var sqlService = SqlService();
    UserProvider userProvider =
        Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
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
        ),
        Flexible(
          child: SingleChildScrollView(padding: EdgeInsets.only(top: 0.sp,bottom: 15.sp),
            child: Column(children: [
              // const SizedBox(height: 30),
                SizedBox(
                  height: 25.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/images/Logo.png"),
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Phone Number Verification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: "Enter the code sent to ",
                        children: [
                          TextSpan(
                              text: "${widget.phoneNumber}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                        style:
                            const TextStyle(color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: true,
                        // obscuringCharacter: '*',
                        // obscuringWidget: const FlutterLogo(
                        //   size: 24,
                        // ),
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text(
                //       "Didn't receive the code? ",
                //       style: TextStyle(color: Colors.black54, fontSize: 15),
                //     ),
                //     TextButton(
                //       onPressed: () => snackBar("OTP resend!!"),
                //       child: const Text(
                //         "RESEND",
                //         style: TextStyle(
                //             color: Color(0xFF91D3B3),
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16),
                //       ),
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                Container(
                  margin:
                       EdgeInsets.symmetric(vertical: 1.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green.shade200,
                            offset: const Offset(1, -2),
                            blurRadius: 5),
                        BoxShadow(
                            color: Colors.green.shade200,
                            offset: const Offset(-1, 2),
                            blurRadius: 5)
                      ]),
                  child: ButtonTheme(
                    height: 50,
                    child: TextButton(
                      onPressed: () async {
                        formKey.currentState!.validate();

                       Response response=await verifyPhone(widget.phoneNumber!,int.parse(currentText));
                       if(response.statusCode==200){
                        // print(response.data['data']);
                       sqlService.saveUser(User.fromJson(response.data['data']),userProvider);
                        snackBar("you are connected");

                         cartScreen.currentState!.popUntil((route) => route.isFirst);
                       
                       }else{
                        snackBar("something wrong return and try again");
                       }
                        // conditions for validating
                        // if (currentText.length != 4 || currentText != "1234") {
                        //   errorController!.add(ErrorAnimationType
                        //       .shake); // Triggering error shake animation
                        //   setState(() => hasError = true);
                        // } else {
                        //   setState(
                        //     () {
                        //       hasError = false;
                        //       snackBar("OTP Verified!!");
                        //     },
                        //   );
                        // }
                      },
                      child: Center(
                          child: Text(
                        "VERIFY".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                        child: TextButton(
                      child: const Text("Clear"),
                      onPressed: () {
                        textEditingController.clear();
                      },
                    )),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Flexible(
                //         child: TextButton(
                //       child: const Text("Clear"),
                //       onPressed: () {
                //         textEditingController.clear();
                //       },
                //     )),
                //     Flexible(
                //         child: TextButton(
                //       child: const Text("Set Text"),
                //       onPressed: () {
                //         setState(() {
                //           textEditingController.text = "123456";
                //         });
                //       },
                //     )),
                //   ],
                // )
            ],),
          ),
        )
          ],
      )
    );
  }
}