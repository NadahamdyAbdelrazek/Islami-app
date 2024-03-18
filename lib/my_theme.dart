import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{
  static Color primarycolor=Color(0xffB7935F);
  static Color primarydarkcolor=Color(0xff141A2EF);
  static Color blachcolor=Color(0xff242424);
  static Color yellowcolor=Colors.yellow;
  static ThemeData lightTheme=ThemeData(brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(fontSize:20,
        fontWeight:FontWeight.bold,),
          bodyMedium: GoogleFonts.elMessiri(fontSize:25,
            fontWeight:FontWeight.w400,),
          bodySmall: GoogleFonts.elMessiri(fontSize:30,
            fontWeight:FontWeight.w600,)
      ),
      appBarTheme:AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black,size: 30),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.elMessiri(color:primarycolor,
            fontSize:20,
            fontWeight:FontWeight.bold,
          )

      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:primarycolor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      )
  );
  static ThemeData darkTheme=ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: primarydarkcolor,
        onPrimary: Colors.white,
        secondary: yellowcolor,
        onSecondary: Colors.white,
        error: Colors.red, onError: Colors.white,
        background: Colors.transparent,
        onBackground: primarydarkcolor,
        surface: Colors.white,
        onSurface:Colors.white),
    textTheme: TextTheme(
  bodyLarge: GoogleFonts.elMessiri(fontSize:20,
    fontWeight:FontWeight.bold,),
      bodyMedium: GoogleFonts.elMessiri(fontSize:25,
  fontWeight:FontWeight.w400,),
  bodySmall: GoogleFonts.elMessiri(fontSize:30,
  fontWeight:FontWeight.w600,)
  ),
    appBarTheme:AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white,size: 30),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: GoogleFonts.elMessiri(color:Colors.white,
          fontSize:20,
          fontWeight:FontWeight.bold,
        )

    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:primarydarkcolor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: yellowcolor,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
  );

}