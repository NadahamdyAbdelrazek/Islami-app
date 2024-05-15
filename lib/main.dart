import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:islami/home/hadeth_detail.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/provider/My_provider.dart';
import 'package:islami/sura_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/Home_Screen.dart';

void main() {
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider()
        ..getLang()
        ..getTheme(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ScreenUtilInit(
      child: MaterialApp(
        locale: Locale(provider.languagecode),
        themeMode: provider.myTheme,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        darkTheme: MyThemeData.darkTheme,
        theme: MyThemeData.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routename,
        routes: {
          HomeScreen.routename: (context) => HomeScreen(),
          hadethdetail.routename: (context) => hadethdetail(),
          suradetails.routename: (context) => suradetails(),
        },
      ),
    );
  }
}
