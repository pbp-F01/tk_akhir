import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter/services.dart' as root_budle;

import '../models/review_umkm_model.dart';

class GoUmkmProvider {

  String rootUrlDev='https://pbpf01-midterm.up.railway.app';

 getReviewUMKM() async {
    // final jsonData =
    // await root_budle.rootBundle.loadString('assets/umkm.json');
    // final list = json.decode(jsonData) as Map<String, dynamic>;
    // return ReviewUmkmModel.fromJson(list);
    Uri uri= Uri.parse('$rootUrlDev/reviewUMKM/json/');
    var result =await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    if(result.statusCode==200){
      var jsonString = result.body;
      var jsonMap = json.decode(jsonString);
      return jsonMap;
    }
  }

  getUmkm() async{
    Uri uri= Uri.parse('$rootUrlDev/profile-umkm/json/');
    var result =await http.get(
      uri,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
    );
    if(result.statusCode==200){
      var jsonString = result.body;
      var jsonMap = json.decode(jsonString);
      return jsonMap;
    }
  }
}