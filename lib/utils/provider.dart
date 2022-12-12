import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:goumkm/pages/home_page.dart';
import 'package:http/http.dart' as http;

class GoUmkmProvider {

  String rootUrlDev='https://pbpf01-midterm.up.railway.app';

 getReviewUMKM() async {
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
  addReview(BuildContext context,var request,String rating,String comment,String idUmkm) async{
    var result = await request.post("https://pbpf01-midterm.up.railway.app/reviewUMKM/rate_flutter/$idUmkm", {
      'rating': rating,
      'comment':comment,
    },

    );
    print(result);
    if(result['status'] = true){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }
  }
}
