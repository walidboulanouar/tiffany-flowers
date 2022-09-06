
import 'package:flutter/material.dart';



class LoadingProvider with ChangeNotifier {
  bool _isLoading = true;
 

  bool get loading => _isLoading;
  
   setloading() {
  _isLoading=!_isLoading;
    notifyListeners();
  }
  
}
