import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/home/hadeth_detail.dart';
import 'package:islami/home/hadeth_model.dart';

class ahadethtab extends StatefulWidget {
  ahadethtab({super.key});

  @override
  State<ahadethtab> createState() => _ahadethtabState();
}

class _ahadethtabState extends State<ahadethtab> {
  List<hadethmodel> allahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allahadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/hadeth_logo.png"),
        Divider(
          color: Color(0xffB7935F),
          thickness: 3,
        ),
        Text(
          "الأحاديث",
          style:
              GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Divider(
          color: Color(0xffB7935F),
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Color(0xffB7935F),
              thickness: 1,
              indent: 50,
              endIndent: 50,
            ),
            itemBuilder: (context, index) {
              return InkWell(onTap: (){
                Navigator.pushNamed(context, hadethdetail.routename,
                  arguments:allahadeth[index],
                );
              },
                child: Text(
                  allahadeth[index].title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.elMessiri(
                    fontSize: 25,
                  ),
                ),
              );
            },
            itemCount: allahadeth.length,
          ),
        )
      ],
    );
  }

  loadHadethFile() async {
    rootBundle.loadString("assets/files/ahadeth.txt").then((hadethfile) {
      List<String> ahadeth = hadethfile.split("#");
      for (int i = 0; i < ahadeth.length; i++) {
        String hadethone = ahadeth[i];
        List<String> hadethlines = hadethone.trim().split("\n");
        String title = hadethlines[0];
        hadethlines.removeAt(0);
        List<String> content = hadethlines;
        hadethmodel HadethModel = hadethmodel(title, content);
        allahadeth.add(HadethModel);
      }
      setState(() {});
    });
  }
}
