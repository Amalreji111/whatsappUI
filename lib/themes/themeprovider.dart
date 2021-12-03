import 'package:flutter/material.dart';
import 'themepreferences.dart';

class ThemeModel extends ChangeNotifier {
  bool _isdark = false;
  themepreferences _preference = themepreferences();
  bool get isDark => _isdark;
  ThemeModel() {
    _isdark = true;
    _preference = themepreferences();
    getPreferences();
  }
  getPreferences() async {
    _isdark = await _preference.gettheme();
    notifyListeners();
  }

  set isDark(bool value) {
    _isdark = value;
    _preference.settheme(value);
    notifyListeners();
  }
}
