import 'package:flutter/material.dart';

import '../models/Banner.dart' as b;
class BannerProvider with ChangeNotifier {
  List<b.Banner> _banners = [];
  

  List<b.Banner> get banners => _banners;
  
  set banners(List<b.Banner> list) {
    _banners = list;
    notifyListeners();
  }
  
}
