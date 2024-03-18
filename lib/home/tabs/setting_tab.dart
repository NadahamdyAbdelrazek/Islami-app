import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/home/sheets/language_bottom_sheet.dart';

import '../sheets/Theme_bottom_sheet.dart';


class settingtab extends StatelessWidget {
  const settingtab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Text("Language"),
        SizedBox(height: 12,),
        InkWell(onTap: (){
          showModalBottomSheet(context: context,isDismissible: true,
            isScrollControlled: true,
            builder: (context) {
            return Container(height: MediaQuery.of(context).size.height*.7,
              child: Languagebottomsheet(),
              );
          },);
        },
          child: Container(width: double.infinity
              ,padding: EdgeInsets.symmetric(vertical:12 ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text("Arabic"),
              )),
        ),
        SizedBox(height: 35,),
        Text("Theme"),
        SizedBox(height: 12,),
        InkWell(onTap: (){
          showModalBottomSheet(context: context, builder: (context) {
            return Themebottomsheet();
          },);
        },
          child: Container(width: double.infinity
              ,padding: EdgeInsets.symmetric(vertical:12 ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text("Light"),
              )),
        ),
        ])

    );
  }
}

