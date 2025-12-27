import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.orange,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.pinkAccent,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
      assert(
        selectedColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(colorSchemeSeed: colorList[selectedColor]);
}
