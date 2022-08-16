

import 'package:flutter/material.dart';

class IndexProvider with ChangeNotifier {
  
  int _currentIndex=2;
  int _productCount=1;

  
  int  get currentIndex => _currentIndex;
int  get productCount => _productCount;
  
   setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
    }
     addOne() {
    _productCount += 1;
    notifyListeners();
    }
    removeOne() {
      if(_productCount!=1){
        _productCount -= 1;
        notifyListeners();
      }
    
    
    }
  }