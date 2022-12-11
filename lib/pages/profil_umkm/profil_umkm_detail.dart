import 'package:flutter/material.dart';
import 'package:goumkm/widgets/text_profil_umkm_detail.dart';
import 'package:goumkm/models/umkm_model.dart';
import 'package:goumkm/theme.dart';

class ProfilUmkmDetail extends StatelessWidget {
  final UmkmModel umkmModel;

  const ProfilUmkmDetail({super.key, required this.umkmModel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
          margin: const EdgeInsets.all(10),
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    )),
                Image.network(umkmModel.fields!.foto!),
                TextProfilUmkmDetail(
                  titleText: "Nama UMKM",
                  subTitleText: umkmModel.fields!.pemilik.toString(),
                  fontSize: 20,
                ),
                TextProfilUmkmDetail(
                  titleText: "No. Telp",
                  subTitleText: umkmModel.fields!.noTelepon.toString(),
                  fontSize: 15,
                ),
                TextProfilUmkmDetail(
                  titleText: "Email",
                  subTitleText: umkmModel.fields!.email!,
                  fontSize: 15,
                ),
                TextProfilUmkmDetail(
                  titleText: "Kontak",
                  subTitleText: umkmModel.fields!.kontak!,
                  fontSize: 15,
                ),
                TextProfilUmkmDetail(
                  titleText: "Kota",
                  subTitleText: umkmModel.fields!.kota!,
                  fontSize: 15,
                ),
                TextProfilUmkmDetail(
                  titleText: "Provinsi",
                  subTitleText: umkmModel.fields!.provinsi!,
                  fontSize: 15,
                ),
                TextProfilUmkmDetail(
                  titleText: "Kodepos",
                  subTitleText: umkmModel.fields!.kodepos.toString(),
                  fontSize: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: greenColor),
                  child: const Text("Delete"),
                )
              ],
            ),
          )),
    );
  }
}
