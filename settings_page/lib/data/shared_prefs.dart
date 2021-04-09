import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final String fontSizeKey = 'font_size';
  final String colorKey = 'color';
  static SharedPreferences _sp;

  static SharedPrefs _instance;

  SharedPrefs._internal();

  factory SharedPrefs() {
    if (_instance == null) {
      _instance = SharedPrefs._internal();
    }
    return _instance;
  }

  Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  Future setColor(int color) {
    print('Set Method--');
    print(color);
    return _sp.setInt(colorKey, color);
  }

  int getColor() {
    int color = _sp.getInt(colorKey);
    if (color == null) {
      color = 0xff1976d2;
    }
    print('Get Method--');
    print(color);
    return color;
  }

  //TODO set e get fontSize
}
