import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/UserProvider.dart';
import '../services/Services.dart';
import '../services/SqlService.dart';
import '../translations/locale_keys.g.dart';
import '../widgets/appbar_widget.dart';

// This class handles the Page to edit the Email Section of the User Profile.
class EditEmailFormPage extends StatefulWidget {
  const EditEmailFormPage({Key? key}) : super(key: key);

  @override
  EditEmailFormPageState createState() {
    return EditEmailFormPageState();
  }
}

class EditEmailFormPageState extends State<EditEmailFormPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  // var user = UserData.myUser;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void updateUserValue(String email) {
    // user.email = email;
  }

  @override
  Widget build(BuildContext context) {
    var sqlService = SqlService();
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          appBar: buildAppBar(context),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          width: 320,
                          child: Text(
                           LocaleKeys.WhatisYourEmail.tr(),
                            style: TextStyle(
                              color: Color(0xff73BFBD),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: SizedBox(
                              height: 100,
                              width: 320,
                              child: TextFormField(
                                // Handles Form Validation
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return LocaleKeys.EnterEmail.tr();
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff73BFBD)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffD8AA6B)),
                                    ),
                                    // border: InputBorder,
                                    labelText: LocaleKeys.EmailAdress.tr(),
                                    floatingLabelStyle:
                                        TextStyle(color: Color(0xffD8AA6B)),
                                    labelStyle:
                                        TextStyle(color: Color(0xff73BFBD))),
    
                                controller: emailController,
                              ))),
                      Padding(
                          padding: EdgeInsets.only(top: 150),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: 320,
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Color(0xffD8AA6B))),
                                  onPressed: () async {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate() &&
                                        EmailValidator.validate(
                                            emailController.text)) {
                                      // updateUserValue(emailController.text);
                                      // Navigator.pop(context);
                                      showGeneralDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return SafeArea(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              padding: EdgeInsets.all(20),
                                              color: Colors.transparent,
                                              child: Center(
                                                child: SpinKitWave(
                                                  color: Color(0xff73BFBD),
                                                  size: 50.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                      Response rs = await updateUserEmail(
                                          userProvider.user!.phone,
                                          emailController.text);
                                      if ((rs.statusCode == 200)) {
                                        sqlService.editUserEmail(
                                            emailController.text, userProvider);
    
                                        Navigator.of(context, rootNavigator: true)
                                                .canPop()
                                            ? Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop()
                                            : null;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Color(0xffD8AA6B),
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                              LocaleKeys.EmailUpdated.tr(),
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration: const Duration(seconds: 2),
                                          ),
                                        );
                                      } else {
                                        Navigator.of(context, rootNavigator: true)
                                                .canPop()
                                            ? Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop()
                                            : null;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Color(0xffD8AA6B),
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                             LocaleKeys.EmailNotUpdated.tr(),
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
                                  child:  Text(
                                   LocaleKeys.Update.tr(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              )))
                    ]),
              ),
            ),
          )),
    );
  }
}
