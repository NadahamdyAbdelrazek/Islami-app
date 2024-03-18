import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/home/tabs/Quran_tab.dart';
import 'package:islami/home/tabs/ahadeth_tab.dart';
import 'package:islami/home/tabs/radio_tab.dart';
import 'package:islami/home/tabs/sebha_tab.dart';
import 'package:islami/home/tabs/setting_tab.dart';
import 'package:islami/provider/My_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {

  static const String routename = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);

    var assetsimage=new AssetImage("assets/images/splash_logo.png");
    var image=new Image(image:assetsimage,height: 300);


    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getBackgroundImagepath()),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "إسلامي",
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(


            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            iconSize: 30,
            items: [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                  "assets/images/ic_quran.png"),), label: ""),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                  "assets/images/ic_ahadeth.png")), label: ""),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                  "assets/images/ic_sebha.png")), label: ""),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(
                  "assets/images/ic_radio.png")), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            ]
        ),
        body: tabs[index],
      )
      ,
    );
  }

  List<Widget> tabs = [
    Qurantab(),
    ahadethtab(),
    sebhatab(),
    radiotab(),
    settingtab(),
  ];
}
