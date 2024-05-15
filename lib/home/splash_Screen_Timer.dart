import 'package:flutter/material.dart';
import 'package:islami/home/Home_Screen.dart';

class splashscreen extends StatefulWidget {
  static const String routename="splashScreen";
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  void initstate() {
    Future.delayed(Duration(seconds: 4), () {
    //  Navigator.pushNamedAndRemoveUntil(Home_Screen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset("assets/images/splash_logo.png",)),);
  }
}
