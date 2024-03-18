

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/provider/My_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Themebottomsheet extends StatelessWidget {


  Themebottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell( onTap: (){
              provider.changetheme(ThemeMode.light);
            },
              child: Text(AppLocalizations.of(context)!.light,style: GoogleFonts.elMessiri(fontSize:30,
                  fontWeight:FontWeight.w300,color:provider.myTheme==ThemeMode.light?MyThemeData.primarycolor:MyThemeData.blachcolor)),
            ),
            provider.myTheme==ThemeMode.light?
            Icon(Icons.done,size: 30,color: MyThemeData.primarycolor): SizedBox(),
          ],
        ),

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell( onTap: (){
              provider.changetheme(ThemeMode.dark);
            },
              child: Text(AppLocalizations.of(context)!.dark,style: GoogleFonts.elMessiri(fontSize:30,
                  fontWeight:FontWeight.w300,color:provider.myTheme==ThemeMode.light?MyThemeData.blachcolor:MyThemeData.primarycolor)),
            ),
            provider.myTheme==ThemeMode.light?SizedBox():Icon(Icons.done,size: 30,color: MyThemeData.primarycolor,)
          ],
        ),
      ],),
    );
  }
}
