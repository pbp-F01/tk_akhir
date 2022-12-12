import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:goumkm/widgets/input_field.dart';
import 'package:goumkm/theme.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:goumkm/widgets/toast.dart';

class ProfilUmkmForm extends StatefulWidget {
  const ProfilUmkmForm({super.key});

  @override
  State<ProfilUmkmForm> createState() => _ProfilUmkmFormState();
}

class _ProfilUmkmFormState extends State<ProfilUmkmForm> {
  final formKey = GlobalKey<FormState>();
  final urlRequest = "https://pbpf01-midterm.up.railway.app/profile-umkm/add/";

  final namaUMKMController = TextEditingController();
  final noTeleponontroller = TextEditingController();
  final emailController = TextEditingController();
  final kontakController = TextEditingController();
  final kotaController = TextEditingController();
  final provinsiController = TextEditingController();
  final kodeposController = TextEditingController();
  final urlFotoController = TextEditingController();

  void clear() {
    // Clean up the controller when the widget is disposed.
    namaUMKMController.clear();
    noTeleponontroller.clear();
    emailController.clear();
    kontakController.clear();
    kotaController.clear();
    provinsiController.clear();
    kodeposController.clear();
    urlFotoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var request = context.read<CookieRequest>();

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 65.0),
        child: SizedBox(
            width: 60,
            height: 50,
            child: ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  scrollable: true,
                  title: const Text('Tambah Profil UMKM'),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          InputField(
                            text: "Nama UMKM",
                            inputType: TextInputType.text,
                            controller: namaUMKMController,
                          ),
                          InputField(
                              text: "No. Telp",
                              inputType: TextInputType.number,
                              controller: noTeleponontroller),
                          InputField(
                              text: "Email",
                              inputType: TextInputType.emailAddress,
                              controller: emailController),
                          InputField(
                              text: "Kontak",
                              inputType: TextInputType.text,
                              controller: kontakController),
                          InputField(
                              text: "Kota",
                              inputType: TextInputType.text,
                              controller: kotaController),
                          InputField(
                              text: "Provinsi",
                              inputType: TextInputType.text,
                              controller: provinsiController),
                          InputField(
                              text: "Kodepos",
                              inputType: TextInputType.number,
                              controller: kodeposController),
                          InputField(
                              text: "URL Foto",
                              inputType: TextInputType.text,
                              controller: urlFotoController),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greenColor,
                        ),
                        child: const Text("Add"),
                        onPressed: () async {
                          var data = convert.jsonEncode(
                            <String, String?>{
                              'nama': namaUMKMController.text,
                              'no_telepon': noTeleponontroller.text,
                              'email': emailController.text,
                              'kontak': kontakController.text,
                              'kota': kotaController.text,
                              'provinsi': provinsiController.text,
                              'kodepos': kodeposController.text,
                              'foto': urlFotoController.text
                            },
                          );

                          if (formKey.currentState!.validate()) {
                            if (request.jsonData['user_data'] != null &&
                                request.jsonData['user_data']['role'] == 'P') {
                              await request
                                  .post(urlRequest, data)
                                  .then((response) => {
                                        if (response['status'])
                                          {
                                            clear(),
                                            Navigator.of(context).pop(),
                                            toast(context, false,
                                                response['message']),
                                            // formKey.currentState!.reset(),
                                          }
                                        else
                                          {
                                            Navigator.of(context).pop(),
                                            toast(context, true,
                                                response['message'])
                                          }
                                      });
                            } else {
                              Navigator.of(context).pop();
                              toast(context, true,
                                  "Anda bukan sebagai Pemilik UMKM atau belum login!");
                            }
                          } else {
                            Navigator.of(context).pop();
                            toast(context, true, "Input tidak valid!");
                          }
                        }),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: darkGreenColor,
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.add),
            )));
  }
}
