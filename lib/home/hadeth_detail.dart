import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/home/hadeth_model.dart';
import 'package:islami/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/My_provider.dart';

class hadethdetail extends StatelessWidget {
  static const String routename = "hadethdetail";

  const hadethdetail({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    var model = ModalRoute
        .of(context)!
        .settings
        .arguments as hadethmodel;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getBackgroundImagepath()),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            model.title,
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: model.content.isEmpty
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
                model.content[index],
                textDirection:TextDirection.rtl,
                textAlign: TextAlign.center,
                style: GoogleFonts.elMessiri(fontSize: 20),
              );
            },
            itemCount: model.content.length,
          ),
        ),
      ),
    );
  }
}
