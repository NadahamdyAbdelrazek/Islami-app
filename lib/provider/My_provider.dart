import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islami/home/api_manager/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/models/RadioModel.dart';

class MyProvider extends ChangeNotifier {
  String languagecode = "en";
  List<Radios> radios=[];
  ThemeMode myTheme = ThemeMode.light;

  Future<void> getAllRadios()async{
    try{
      radios= await ApiManager.getAllRadio();
      notifyListeners();
    }catch(e){
      print(e);
      notifyListeners();
    }

  }
  AudioPlayer audioPlayer=AudioPlayer();
  Future<void> playAudio(String url)async{
    audioPlayer.pause();
   await audioPlayer.play(UrlSource(url));
   notifyListeners();
  }
  Future<void> pauseAudio()async{
    await audioPlayer.pause();
    notifyListeners();
  }
  
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
