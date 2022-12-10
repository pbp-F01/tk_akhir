import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:goumkm/models/berita_model.dart';

class BeritaList extends StatefulWidget {
  const BeritaList({super.key});

  @override
  State<BeritaList> createState() => _BeritaListState();
}

class _BeritaListState extends State<BeritaList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.all(12.0),
      height: 130,
      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(3.0)),
    );
  }
}