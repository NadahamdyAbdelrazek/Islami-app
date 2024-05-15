import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String languagecode = "en";
  ThemeMode myTheme = ThemeMode.light;

  changeLanguage(String code) async {
    if (code == languagecode) {
      return;
    }
    languagecode = code;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", code);
  }

  changetheme(ThemeMode mode) async {
    if (mode == myTheme) {
      return;
    }
    myTheme = mode;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", mode == ThemeMode.dark);
  }

  String getBackgroundImagepath() {
    if (myTheme == ThemeMode.light) {
      return "assets/images/background.png";
    } else {
      return "assets/images/dark_bg.png";
    }
  }

  Future<void> getLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString("lang");
    if (lang != null) {
      languagecode = lang;
      notifyListeners();
    }
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool("isDark");
    if (isDark != null) {
      if (isDark) {
        myTheme = ThemeMode.dark;
      } else {
        myTheme = ThemeMode.light;
      }
      notifyListeners();
    }
  }

}
