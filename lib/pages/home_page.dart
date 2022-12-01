import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';
import 'berita_umkm/berita_umkm_page.dart';
import 'profil_umkm/profil_umkm_page.dart';
import 'review_umkm/review_umkm_page.dart';


class HomePage extends StatefulWidget  {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex=0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final page = [
      ReviewUmkmPage(),
      BeritaUmkmPage(),
      ProfilUmkmPage(),
    ];
    return Scaffold(
      body: page[pageIndex],
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:Colors.transparent,
        color: whiteLightColor,
        items: <Widget>[
          Icon(Icons.rate_review_outlined,color: greenColor,size: 30,),
          Icon(Icons.newspaper, size: 30,color: greenColor,),
          Icon(Icons.person, size: 30,color: greenColor,),
        ],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            pageIndex=index;
          });
        },
      ),
    );
  }

}

