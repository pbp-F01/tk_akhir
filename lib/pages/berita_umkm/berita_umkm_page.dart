import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goumkm/models/berita_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:goumkm/pages/berita_umkm/berita_utama_card.dart';
import 'package:goumkm/pages/berita_umkm/berita_list_tile.dart';
import 'package:flutter/widgets.dart';

List<NewsModel> listNewsModelCarousel = [];

final ScrollController _firstController = ScrollController();

class BeritaUmkmPage extends StatelessWidget {
  
  const BeritaUmkmPage({Key? key}) : super(key: key);

  Future<List<NewsModel>> fetchNewsModelCarousel() async { //Fetch json data 
        var url = Uri.parse('https://pbpf01-midterm.up.railway.app/berita/json/');
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
        listNewsModelCarousel.clear(); 
        for (var d in data) {
        if (d != null) {
            listNewsModelCarousel.add(NewsModel.fromJson(d));
          }
        }
        return listNewsModelCarousel;
    }    
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, 
        backgroundColor: Colors.transparent,
        title: Text(
          "GoUMKM - GoUMKM News", 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700,)
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Berita Utama",
                  style: TextStyle(
                    fontSize: 15.0, 
                    fontWeight: FontWeight.bold, 
                ),
              ), 
              SizedBox(height: 20,), 
              FutureBuilder(
                future: fetchNewsModelCarousel(), 
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null){
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if(!snapshot.hasData){
                      return Column(
                        children: const [
                          Text("Tidak ada berita"), 
                        ],
                      ); 
                    } else {
                      return Column(
                        children: <Widget>[
                          CarouselSlider.builder(
                            itemCount: 3, 
                            itemBuilder: (context, index, id) => BeritaUtamaCard(snapshot.data[index]), 
                            options: CarouselOptions(
                              aspectRatio: 16/9, 
                              enableInfiniteScroll: false, 
                              enlargeCenterPage: true,
                            ),
                          ), 
                          SizedBox(
                            height: 20.0,
                          ), 
                          Column(
                            children: listNewsModelCarousel.map((e) => BeritaList(e)).toList(), 
                          ),
                          SizedBox(
                            height: 35.0,
                          )
                        ],
                      );
                    }
                  }
                }
              ),
            ],
          )
        )
      )
    );
  }
}
