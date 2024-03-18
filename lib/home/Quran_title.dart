import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/sura_model.dart';

class suraname extends StatelessWidget {
  String name;
  String suranumber;
  suraname({super.key,required this.name,required this.suranumber});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Expanded(
        child: Text(suranumber,
          style: GoogleFonts.elMessiri(
              fontSize: 25, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,),
      ),
      Expanded(
        child: Text(name,
          style: GoogleFonts.elMessiri(
              fontSize: 25, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,),
      )
    ],);
  }
}
