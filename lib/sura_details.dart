import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/provider/My_provider.dart';
import 'package:islami/sura_model.dart';
import 'package:provider/provider.dart';

class suradetails extends StatefulWidget {
  static const String routename = "Suradetails";

  suradetails({super.key});

  @override
  State<suradetails> createState() => _suradetailsState();
}

class _suradetailsState extends State<suradetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    var SuraModel = ModalRoute.of(context)!.settings.arguments as suramodel;
    if (verses.isEmpty) {
      readSurafile(SuraModel.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getBackgroundImagepath()),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            SuraModel.name,
        )
        ),
        body: verses.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.all(16),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    thickness: 2,
                    color: Color(0xffB7935F),endIndent: 50,
                    indent: 50,
                  ),
                  itemBuilder: (context, index) {
                    return Text(
                      "${verses[index]} (${index+1})",
                      textDirection:TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      ),
    );
  }

  void readSurafile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraline = sura.split("\n");
    verses = suraline;
    setState(() {});
  }
}
