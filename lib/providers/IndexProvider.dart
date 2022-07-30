

import 'package:flutter/material.dart';

class IndexProvider with ChangeNotifier {
  
  int _currentIndex=2;

  
  int  get currentIndex => _currentIndex;

  
   setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
    }
  }