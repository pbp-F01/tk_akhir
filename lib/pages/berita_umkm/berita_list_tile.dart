import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goumkm/models/berita_model.dart';
import 'package:goumkm/pages/berita_umkm/berita_detail_page.dart';


class BeritaList extends StatefulWidget {
  BeritaList(this.data, {Key? key}) : super(key: key);
  NewsModel data; 
  @override
  State<BeritaList> createState() => _BeritaListState();
}

class _BeritaListState extends State<BeritaList> {
  
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BeritaDetail(widget.data, widget.data.pk)));
      },
      child: Column(
        children: [
          const Divider(
            color: Colors.black45,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.all(12.0),
            height: 130,
            decoration: BoxDecoration(
              
              color: Colors.transparent, 
              borderRadius: BorderRadius.circular(3), 
            ),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      image: DecorationImage(
                        image: NetworkImage(widget.data.fields!.newsImage!), 
                        fit: BoxFit.fitHeight, 
                      ),
                    ),
                  )
                ), 
                SizedBox(
                  width: 10.0,
                ), 
                Flexible(
                  child: Column(
                    children: [
                      Text(widget.data.fields!.newsTitle!,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold, 
                      ),
                      overflow: TextOverflow.ellipsis,
                      //softWrap: false,
                      maxLines: 3,
                      ),
                      SizedBox(
                        height: 5.0,
                      ), 
                      Text(widget.data.fields!.newsBody!,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      ),
                    ],
                  )
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}