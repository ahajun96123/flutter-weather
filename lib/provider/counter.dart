import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int _count = 0; //private
  String _bgimg = '';

  int get count => _count;
  String get bgimg => _bgimg;

  void incrementCounter() {
    _count++;
    if (_count==2) {
      _bgimg = 'assets/jennie.jpg';
    } else if(_count==3) {
      _bgimg = 'assets/facebook.jpg';
    }
    print(_bgimg);
    notifyListeners();
  }

  void decrementCounter() {
    _count--;
    notifyListeners();
    print(_bgimg);
  }
}//12345678