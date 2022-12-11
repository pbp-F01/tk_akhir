import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:goumkm/models/umkm_model.dart';

Future<List<UmkmModel>> fetchProfilUmkm() async {
  var url =
      Uri.parse('https://pbpf01-midterm.up.railway.app/profile-umkm/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // check melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object UmkmModel
  List<UmkmModel> listUmkm = [];
  for (var d in data) {
    if (d != null) {
      listUmkm.add(UmkmModel.fromJson(d));
    }
  }

  return listUmkm;
}
