
import 'dart:io';

import 'package:flutter/material.dart';


import '../models/User.dart';

class UserProvider with ChangeNotifier {
   User?_user ;
   String? _userImage; 
   File? _pickedimage;
 

 User? get user => _user;
 String? get userImage => _userImage;
 File? get pickedimage => _pickedimage;
  
  set user(User? user) {
    _user = user;
    notifyListeners();
  }
  set pickedimage(File? image) {
    _pickedimage = image;
    notifyListeners();
  }
    deleteImage() {
    _userImage = null;
    notifyListeners();
  }
  set userFisrtName(String firstName) {
    _user!.firstName = firstName;
    
    notifyListeners();
  }
   set userLastName(String lastName) {
    _user!.lastName = lastName;
    
    notifyListeners();
  }
  set userEmail(String email) {
    _user!.email = email;
    
    notifyListeners();
  }
   set userPhone(String phone) {
    _user!.phone = phone;
    
    notifyListeners();
  }
  set userImage(String? image) {
    _userImage = image;
    notifyListeners();
  }
  void deleteUser(){
     _user = null;
     _userImage=null;
    notifyListeners();
  }
  
}
