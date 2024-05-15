import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/home/sheets/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../provider/My_provider.dart';
import '../sheets/Theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class settingtab extends StatelessWidget {
  const settingtab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Text(AppLocalizations.of(context)!.language),
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
                child: Text( provider.languagecode=="en"?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arbic),
              )),
        ),
        SizedBox(height: 35,),
        Text(AppLocalizations.of(context)!.theme),
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
                child: Text(provider.myTheme==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark),
              )),
        ),
        ])

    );
  }
}

