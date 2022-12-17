import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:ecomerceapp/providers/UserProvider.dart';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';


import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../services/Services.dart';
import '../translations/locale_keys.g.dart';


class EditImagePage extends StatefulWidget {
  const EditImagePage({Key? key}) : super(key: key);

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  // var user = UserData.myUser;

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    File? pickedimage;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors
                  .black), // set backbutton color here which will reflect in all screens.
          leading: BackButton(
            onPressed: (() async {
              Navigator.of(context).pop();
              
            }),
            color: Color(0xff73BFBD),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width: 330,
                child: Center(
                  child: Text(
                   LocaleKeys.UploadAPhoto.tr(),
                    style: TextStyle(
                      color: Color(0xff73BFBD),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                    width: 330,
                    child: GestureDetector(
                      onTap: () async {
                        final image = await ImagePicker().pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 50,
                            maxHeight: 500,
                            maxWidth: 500);
    
                        if (image == null) return;
                        File imagee = File(image.path);
                        userProvider.pickedimage = imagee;
                        
                      },
                      child: userProvider.pickedimage != null
                          ? CircleAvatar(
                              radius: 95,
                              backgroundColor: Color(0xff73BFBD),
                              child: CircleAvatar(
                                backgroundColor: Color(0xff73BFBD),
                                backgroundImage:
                                    FileImage(userProvider.pickedimage!),
                                radius: 90,
                              ),
                            )
    
                          //  Image.file(
                          //     fit: BoxFit.cover, userProvider.pickedimage!)
                          : CircleAvatar(
                              radius: 95,
                              backgroundColor: Color(0xff73BFBD),
                              child: CircleAvatar(
                                backgroundColor: Color(0xff73BFBD),
                                backgroundImage:
                                    AssetImage("assets/images/userimage.png"),
                                radius: 90,
                              ),
                            ),
                    ))),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 330,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffD8AA6B))),
                        onPressed: () async {
                          if(userProvider.pickedimage==null) return;
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
                          Response response = await uploadImage(
                              userProvider.user!.phone,
                              userProvider.pickedimage!);
    
                          if ((response.statusCode == 200)) {
                            Navigator.of(context, rootNavigator: true).canPop()
                                ? Navigator.of(context, rootNavigator: true).pop()
                                : null;
                                userProvider.deleteImage();
                          getUserImage(userProvider.user!.phone, userProvider);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Color(0xffD8AA6B),
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                 LocaleKeys.ImageUpdated.tr(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          } else {
                            Navigator.of(context, rootNavigator: true).canPop()
                                ? Navigator.of(context, rootNavigator: true).pop()
                                : null;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Color(0xffD8AA6B),
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  LocaleKeys.ImageNotUpdated.tr(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
    
                         
                        },
                        child:  Text(
                          LocaleKeys.Update.tr(),
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
