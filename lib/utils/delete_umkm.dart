import 'package:http/http.dart' as http;

Future<String> deleteUmkm(int id, String username) async {
  final url =
      Uri.parse("https://kembangin.up.railway.app/profile-umkm/delete/$id/");
  final request = http.Request("DELETE", url);

  final response = await request.send();

  if (response.statusCode != 200) {
    return Future.error("error: status code ${response.statusCode}");
  }

  return await response.stream.bytesToString();
}
