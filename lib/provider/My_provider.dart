import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islami/my_theme.dart';

class MyProvider extends ChangeNotifier{
  String languagecode="en";
  ThemeMode myTheme= ThemeMode.light;
  changeLanguage(String code){
    languagecode=code;
    notifyListeners();

  }
  changetheme(ThemeMode mode){
    myTheme=mode;
    notifyListeners();

  }
  String getBackgroundImagepath(){
    if(myTheme==ThemeMode.light){
      return "assets/images/background.png";
    }else{
      return "assets/images/dark_bg.png";
    }


  }

}