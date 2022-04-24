import 'package:flutter/material.dart';

import 'package:devnote/models/color_scheme_data_model.dart';

class UIProvider extends ChangeNotifier {
  List<ColorSchemeData> colorSchemaList = [
    ColorSchemeData(
      name: 'TR_COLOR_SCHEME.BLUE',
      color: const Color(0xFF6297FF),
    ),
    ColorSchemeData(
      name: 'TR_COLOR_SCHEME.GREEN',
      color: Colors.green,
    ),
    ColorSchemeData(
      name: 'TR_COLOR_SCHEME.PURPLE',
      color: Colors.purple[400]!,
    ),
    ColorSchemeData(
      name: 'TR_COLOR_SCHEME.PINK',
      color: Colors.pink,
    ),
  ];

  int _colorSchemeIndex = 0;

  int get colorSchemeIndex => _colorSchemeIndex;

  void setColorSchemeIndex(newValue) {
    _colorSchemeIndex = newValue;
    notifyListeners();
  }
}
