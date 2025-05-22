

import 'package:flutter/foundation.dart';

class SliderProvider extends ChangeNotifier{

  double _sValue=1.0;

  double get sValue=>_sValue;

  void setSliderValue(double sVal){
    _sValue=sVal;
    print("SliderProviderValue::$_sValue");
    notifyListeners();
  }
}