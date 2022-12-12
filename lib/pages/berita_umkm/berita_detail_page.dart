import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:goumkm/models/berita_model.dart';
import 'package:goumkm/models/comments_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:goumkm/pages/berita_umkm/comment_list.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

List<CommentModel> listCommentModel = [];
String _newComment = ""; 

class BeritaDetail extends StatefulWidget {
  BeritaDetail(this.data, this.indexBerita, {Key? key}) : super(key: key);
 
  NewsModel data;  
  int? indexBerita; 
  int? commentCount;
  Future<List<CommentModel>> fetchNewsModel() async { //Fetch json data 
        var url = Uri.parse('https://pbpf01-midterm.up.railway.app/berita/show_comment');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        
        for (var d in data) {
        if (d != null) {
            //listCommentModel.add(CommentModel.fromJson(d));
            commentCount = commentCount! +1; 
          }
        }
        return listCommentModel;
  }
  @override
  State<BeritaDetail> createState() => _BeritaDetailState();
}

class _BeritaDetailState extends State<BeritaDetail> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.green.shade700,),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                 
              children: [
                Text(
                  widget.data.fields!.newsTitle!, 
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold, 
                  ),
                ), 
                const SizedBox(
                  height: 10.0,
                ), 
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.network(widget.data.fields!.newsImage!),
                ), 
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  widget.data.fields!.newsSource!, style: const TextStyle(
                    color: Colors.black54, 
                    fontSize: 13.0,
                  ),
                ), 
                const SizedBox(
                  height: 20.0,
                ),
                Text(widget.data.fields!.newsBody!),
                const SizedBox(
                  height: 10.0,
                ), 
                const Divider(color: Colors.black45,
                ),
                //Comment 
                CommentCard(indexBerita: widget.indexBerita!), 
              ],
            ),
            
        ), 
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen.shade800,
        onPressed: () {
          showModalBottomSheet(
          context: context,
          builder: (builder) {
              return Container(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(3.0), 
                      topRight: const Radius.circular(3.0), 
                    ), 
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, 
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      )
                    ]
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 10),
                                child: Text("Add comment",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, 
                                ),),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, right: 5), 
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }, 
                                  child: Text(
                                    "Back", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ),
                              ), 
                            ],
                          ),
                          //Form 
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: 
                                  InputDecoration(
                                    labelText: 'Comments',
                                  ),
                                  onChanged: (String? value){
                                    setState(() {
                                      _newComment = value!; 
                                    });
                                  },
                                  onSaved: (String? value){
                                    setState(() {
                                      _newComment = value!;
                                    });
                                  },
                                ),
                                Column(
                                  children: [
                                  TextButton(
                                      child: Text(
                                        "Save", 
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: ()  async {
                                        print(_newComment); 
                                        final response = await request.post("https://pbpf01-midterm.up.railway.app/berita/addComment_flutter/", 
                                          {
                                            'comments_substance': _newComment, 
                                            'news_index': widget.indexBerita.toString(),
                                          }
                                        ); 
                                        print(response);
                                      }, 
                                      
                                    ),
                                  ],
                                ), 
                              ],
                            ),
                          ), 
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          );
        } 
      ), 
    );
  }
}