import 'package:flutter/material.dart';

class BottomNaviIndex with ChangeNotifier{
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeCurrentIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

}