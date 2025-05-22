


import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier{
  int _count=0;
  int get count=>_count;

  void setCounter(){
    _count++;
    print(_count);
    notifyListeners();
  }
}