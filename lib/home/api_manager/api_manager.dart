import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/home/models/RadioModel.dart';

class ApiManager {
  static Future<List<Radios>> getAllRadio() async {
    http.Response responce = await http
        .get(Uri.parse("https://mp3quran.net/api/v3/radios?Language=ar"));
    if(responce.statusCode==200){
      var json= jsonDecode(responce.body);
     RadioModel data= RadioModel.fromJson(json);
     return data.radios??[];
    }else{
      throw "Error";
    }

  }
}
