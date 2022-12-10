import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goumkm/models/berita_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:goumkm/pages/berita_umkm/berita_utama_card.dart';
import 'package:goumkm/pages/berita_umkm/berita_umkm_card_list.dart';
import 'package:flutter/widgets.dart';

List<NewsModel> listNewsModel = [];
final ScrollController _firstController = ScrollController();

class BeritaUmkmPage extends StatelessWidget {
  
  const BeritaUmkmPage({Key? key}) : super(key: key);
  

  Future<List<NewsModel>> fetchNewsModel() async { //Fetch json data 
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
        
        for (var d in data) {
        if (d != null) {
            listNewsModel.add(NewsModel.fromJson(d));
        }
        }

        return listNewsModel;
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
                future: fetchNewsModel(),
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
                          Scrollbar(
                            controller: _firstController,
                            thumbVisibility: true,
                            child: ListView.builder(
                              controller: _firstController,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index)=> Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(3.0),
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data![index].fields.newsImage), 
                                      fit: BoxFit.fitHeight,  
                                      alignment: Alignment.centerLeft,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.transparent,
                                          blurRadius: 2.0,
                                      ), 
                                    ]
                                  ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "${snapshot.data![index].fields.newsTitle}"
                                    ),
                                  ],
                                ),
                              ), 
                            ),
                          ), 
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
