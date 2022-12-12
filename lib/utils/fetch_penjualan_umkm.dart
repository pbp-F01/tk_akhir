import 'package:goumkm/models/penjualan_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<SellingModel>> fetchPenjualan() async {
  var url = Uri.parse('https://pbpf01-midterm.up.railway.app/penjualan/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<SellingModel> listPenjualan = [];
  for (var d in data) {
    if (d != null) {
      listPenjualan.add(SellingModel.fromJson(d));
    }
  }

  return listPenjualan;
}
