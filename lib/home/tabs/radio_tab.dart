import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class radiotab extends StatelessWidget {
  const radiotab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Image.asset("assets/images/radio_image.png"),
        SizedBox(height: 25,),
        Text("إذاعة القرآن الكريم",style: GoogleFonts.elMessiri(
          fontSize:25,
          fontWeight:FontWeight.w600,
        ),),
        SizedBox(height: 30,),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          Icon(Icons.skip_previous,color: Color(0xffB7935F),size: 50),
          SizedBox(width: 20),
          Icon(Icons.play_arrow,size: 80,color: Color(0xffB7935F),),
          SizedBox(width: 20),
          Icon(Icons.skip_next,color: Color(0xffB7935F),size: 50),

        ],),
      ],),
    );
  }
}
