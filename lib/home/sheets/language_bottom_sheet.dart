import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/my_theme.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../provider/My_provider.dart';

class Languagebottomsheet extends StatelessWidget {

   Languagebottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell( onTap: (){
              provider.changeLanguage("en");
            },
              child: Text(AppLocalizations.of(context)!.english,style: GoogleFonts.elMessiri(fontSize:30,
                  fontWeight:FontWeight.w300,color:provider.languagecode=="en"?MyThemeData.primarycolor:MyThemeData.blachcolor)),
            ),
            provider.languagecode=="en"?
            Icon(Icons.done,size: 30,color: MyThemeData.primarycolor): SizedBox(),
          ],
        ),

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(  onTap: (){
              provider.changeLanguage("ar");
            },
              child: Text(AppLocalizations.of(context)!.arbic,style: GoogleFonts.elMessiri(fontSize:30,
                  fontWeight:FontWeight.w300,color:provider.languagecode=="en"?MyThemeData.blachcolor:MyThemeData.primarycolor)),
            ),
            provider.languagecode=="en"?SizedBox():Icon(Icons.done,size: 30,color: MyThemeData.primarycolor,)
          ],
        ),
      ],),
    );
  }
}
