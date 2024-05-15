import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class sebhatab extends StatefulWidget {
  sebhatab({super.key});

  @override
  State<sebhatab> createState() => _sebhatabState();
}

class _sebhatabState extends State<sebhatab> {
  List<String> sebhaname = [
    "سبحان الله",
    "الله اكبر",
    "الحمد الله",
    "لا اله الا الله"
  ];
  int index = 0;
  int count = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Stack(
        alignment: Alignment.topCenter,
        children: [
        Padding(
            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * .075),
            child: Transform.rotate(angle: angle,
                child: Image.asset("assets/images/body_sebha_logo.png")),
              ),
      Image.asset("assets/images/head_sebha_logo.png"),
      ],
      ),
      SizedBox(height: 25,),

      Text("عدد التسبيحات",
      style: GoogleFonts.elMessiri(
      fontSize: 25, fontWeight: FontWeight.w600)),
      Container(padding:EdgeInsets.all(18) ,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xffB7935F),
      ),
      width: 69,
      height: 70,
      child: Text(
      "$count",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      ),
      ),
      InkWell(onTap: (){
      sebha();
      },
      child: Container(decoration: BoxDecoration(color: Color(0xffB7935F),borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(12),
      width: 137.w,
      height: 51.h,
      child: Text(sebhaname[index]
      ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.white)),
      ),
      )
      ],
      ),
    );
  }

  sebha() {
    if (count < 33) {
      angle += 0.1;
      count++;
    } else {
      if (index < 3) {
        index++;
        count = 0;
      } else {
        index = 0;
        count = 0;
      }
    }
    setState(() {});
  }

}
