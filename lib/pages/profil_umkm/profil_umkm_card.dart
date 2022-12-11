import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/models/umkm_model.dart';
import 'package:goumkm/pages/profil_umkm/profil_umkm_detail.dart';
import 'package:goumkm/theme.dart';

class ProfilUmkmCard extends StatelessWidget {
  final UmkmModel umkmModel;

  const ProfilUmkmCard({super.key, required this.umkmModel});

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(UmkmModel umkmModel) => ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        title: Text(
          umkmModel.fields!.nama!,
        ),
        subtitle: Text(umkmModel.fields!.pemilik!),
        onTap: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ProfilUmkmDetail(
                        umkmModel: umkmModel,
                      ))
            });

    return Card(
        margin:
            EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h, bottom: 20.h),
        color: greyLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        shadowColor: greenColor,
        elevation: 6.0,
        child: Column(
          children: [
            Image.network(umkmModel.fields!.foto!),
            makeListTile(umkmModel)
          ],
        ));
  }
}
