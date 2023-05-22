import 'dart:math';
import 'package:flutter/material.dart';
import 'package:test_application/base.dart';
import 'package:test_application/navigators/change_screen_navigator.dart';
import '../models/color.dart';

class ChangeColorViewModel extends BaseViewModel<ChangeColorNavigator> {
  ColorModel _currentColor = ColorModel(255, 255, 255);
  Color textColor = Colors.black;


  Color get backgroundColor => Color.fromRGBO(
    _currentColor.red,
    _currentColor.green,
    _currentColor.blue,
    1,
  );

  void changeBackgroundColor() {
    final random = Random();
    final newColor = ColorModel(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    textColor = _getContrastingTextColor(backgroundColor);
    _currentColor = newColor;
    notifyListeners();
  }
  Color _getContrastingTextColor(Color color) {
    final luminance = (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
