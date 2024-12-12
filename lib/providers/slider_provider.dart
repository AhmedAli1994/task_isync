import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double sliderValue = 0.5;

  void updateSliderValue(double newValue) {
    sliderValue = newValue;
    notifyListeners();
  }
}
