import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:goumkm/models/berita_model.dart';
import 'package:goumkm/pages/berita_umkm/berita_detail_page.dart';

class BeritaUtamaCard extends StatefulWidget {
  BeritaUtamaCard(this.data, {Key? key}): super(key: key);
  NewsModel data; 

  @override
  State<BeritaUtamaCard> createState() => _BeritaUtamaCardState();
}

class _BeritaUtamaCardState extends State<BeritaUtamaCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BeritaDetail(widget.data, widget.data.pk)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0), 
          image: DecorationImage(
            image: NetworkImage(widget.data.fields!.newsImage!), 
            fit: BoxFit.fill
            )
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0), 
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54], 
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter, 
            ), 
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.data.fields!.newsTitle!,
              style: TextStyle(
                color: Colors.white, 
                fontSize: 15, 
                fontWeight: FontWeight.bold, 
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}