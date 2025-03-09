import 'package:flutter/material.dart';

class ColorCounters extends ChangeNotifier {
  int _redCount = 0;
  int _blueCount = 0;

  int get counter1 => _redCount;
  int get counter2 => _blueCount;

  void incrementCounter1() {
    _redCount++;
    notifyListeners();
  }

  void incrementCounter2() {
    _blueCount++;
    notifyListeners();
  }
}
