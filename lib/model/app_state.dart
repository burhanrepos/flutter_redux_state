import 'package:flutter/material.dart';

class AppState {
  double sliderFontSize = 0.0;
  bool bold = false;
  bool italic = false;
  Color color = Colors.black;

  // default constructor
  AppState(
      {required this.sliderFontSize,
      this.bold = false,
      this.italic = false,
      this.color = Colors.black});

  // named constructor

  AppState.fromAppState(AppState another) {
    sliderFontSize = another.sliderFontSize;
    bold = another.bold;
    italic = another.italic;
    color = another.color;
  }

  double get viewFontSize => sliderFontSize * 30;
}
