import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goumkm/models/comments_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<FieldsComments> listCommentModel = [];
//final ScrollController _firstController = ScrollController();

class CommentCard extends StatefulWidget {
  final int indexBerita;
  
  const CommentCard({Key? key, required this.indexBerita,}) : super(key: key);
  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {

  Future<List<FieldsComments>> fetchCommentModel() async { //Fetch json data 
    var url = Uri.parse('https://pbpf01-midterm.up.railway.app/berita/show_comment');
    var response = await http.get(
    url,
    headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));
    listCommentModel.clear(); 

    for (var d in data) {
      if (d != null && CommentModel.fromJson(d).fieldsComments!.news == widget.indexBerita) {
        listCommentModel.add(CommentModel.fromJson(d).fieldsComments!);
        }
      }
    return listCommentModel;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCommentModel(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null){
          return const Center(child: CircularProgressIndicator());
        } else {
          if (listCommentModel.length == 0){
            return Row(
              children: const [
                Icon(
                  Icons.comment,
                  size: 15.0,
                ),
                SizedBox(
                  width: 9.0,
                ),
                Text("Belum terdapat komentar", 
                  style: TextStyle(
                    fontSize: 15.0
                  ),
                )
              ],
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: listCommentModel.length,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                //padding: const EdgeInsets.all(20.0),
                //alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: " user | ", 
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: "${snapshot.data![index].dateAdded}"),
                      ]
                    )  
                  ),
                  Text("${snapshot.data![index].commentsSubstance}"), 
                  ]
                ),
              ), 
            );
          }
        }
      }
    );    
  }
}