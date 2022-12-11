import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/utils/fetch_profil_umkm.dart';
import 'package:goumkm/models/umkm_model.dart';
import 'package:goumkm/pages/profil_umkm/profil_umkm_card.dart';
import 'package:goumkm/pages/profil_umkm/profil_umkm_form.dart';

class ProfilUmkmPage extends StatelessWidget {
  const ProfilUmkmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<UmkmModel>> futureFetch = fetchProfilUmkm();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "GoUMKM - Profil UMKM",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: FutureBuilder(
                    future: futureFetch,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisExtent: 300),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => ProfilUmkmCard(
                            umkmModel: snapshot.data![index],
                          ),
                        );
                      }
                    }))
          ],
        ),
      ),
      floatingActionButton: const ProfilUmkmForm(),
    );
  }
}
