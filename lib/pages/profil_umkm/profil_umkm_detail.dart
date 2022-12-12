import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goumkm/widgets/text_profil_umkm_detail.dart';
import 'package:goumkm/models/umkm_model.dart';
import 'package:goumkm/theme.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:goumkm/widgets/toast.dart';

class ProfilUmkmDetail extends StatefulWidget {
  final UmkmModel umkmModel;

  const ProfilUmkmDetail({super.key, required this.umkmModel});

  @override
  State<ProfilUmkmDetail> createState() => _ProfilUmkmDetailState();
}

class _ProfilUmkmDetailState extends State<ProfilUmkmDetail> {
  void refreshWidget() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var request = context.read<CookieRequest>();

    final urlRequest =
        "https://pbpf01-midterm.up.railway.app/profile-umkm/delete/${widget.umkmModel.pk}/";

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
                Image.network(widget.umkmModel.fields!.foto!),
                TextProfilUmkmDetail(
                  titleText: "Nama UMKM",
                  subTitleText: widget.umkmModel.fields!.pemilik.toString(),
                  fontSize: 20,
                ),
                TextProfilUmkmDetail(
                  titleText: "No. Telp",
                  subTitleText: widget.umkmModel.fields!.noTelepon.toString(),
                  fontSize: 15,
                ),
                TextProfilUmkmDetail(
                  titleText: "Email",
                  subTitleText: widget.umkmModel.fields!.email!,
                  fontSize: 15,
                ),
                TextProfilUmkmDetail(
                  titleText: "Kontak",
                  subTitleText: widget.umkmModel.fields!.kontak!,
                  fontSize: 15,
                ),
                TextProfilUmkmDetail(
                  titleText: "Kota",
                  subTitleText: widget.umkmModel.fields!.kota!,
                  fontSize: 15,
                ),
                TextProfilUmkmDetail(
                  titleText: "Provinsi",
                  subTitleText: widget.umkmModel.fields!.provinsi!,
                  fontSize: 15,
                ),
                TextProfilUmkmDetail(
                  titleText: "Kodepos",
                  subTitleText: widget.umkmModel.fields!.kodepos.toString(),
                  fontSize: 15,
                ),
                if (request.jsonData['user_data'] != null &&
                    request.jsonData['user_data']['role'] == 'P')
                  ElevatedButton(
                    onPressed: () async {
                      await request.post(urlRequest, null).then((res) => {
                            if (res['status'] == true)
                              {
                                Navigator.of(context).pop(),
                                refreshWidget(),
                                toast(context, false, res['message'])
                              }
                            else
                              {toast(context, true, res['message'])}
                          });
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: greenColor),
                    child: const Text("Delete"),
                  )
              ],
            ),
          )),
    );
  }
}
