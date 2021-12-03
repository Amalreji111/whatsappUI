import 'package:shared_preferences/shared_preferences.dart';

class themepreferences {
  static const PREF_KEY = 'pref_key';
  void settheme(bool val) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_KEY, val);
  }

  gettheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(PREF_KEY);
  }
}
