import 'package:flutter/material.dart';
import 'package:goumkm/widgets/input_field.dart';
import 'package:goumkm/theme.dart';

class ProfilUmkmForm extends StatelessWidget {
  const ProfilUmkmForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
                        children: const <Widget>[
                          InputField(
                              text: "Nama UMKM", inputType: TextInputType.text),
                          InputField(
                              text: "No. Telp",
                              inputType: TextInputType.number),
                          InputField(
                              text: "Email",
                              inputType: TextInputType.emailAddress),
                          InputField(
                              text: "Kontak", inputType: TextInputType.text),
                          InputField(
                              text: "Kota", inputType: TextInputType.text),
                          InputField(
                              text: "Provinsi", inputType: TextInputType.text),
                          InputField(
                              text: "Kodepos", inputType: TextInputType.number),
                          InputField(
                              text: "URL Foto", inputType: TextInputType.text),
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
                          if (formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 16.0,
                                    ),
                                    shrinkWrap: true,
                                    children: [
                                      const Center(
                                        child: Text(
                                          "Berhasil menambahkan Profil UMKM!",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Kembali'),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                            formKey.currentState!.reset();
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
