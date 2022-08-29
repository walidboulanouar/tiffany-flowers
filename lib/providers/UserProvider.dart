
import 'package:flutter/material.dart';


import '../models/User.dart';

class UserProvider with ChangeNotifier {
   User?_user ;
 

 User? get user => _user;
  
  set user(User? user) {
    _user = user;
    notifyListeners();
  }
  void deleteUser(){
     _user = null;
    notifyListeners();
  }
  
}
