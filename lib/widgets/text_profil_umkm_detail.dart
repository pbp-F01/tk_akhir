import 'package:flutter/material.dart';

class TextProfilUmkmDetail extends StatefulWidget {
  final String titleText, subTitleText;
  final int fontSize;

  const TextProfilUmkmDetail(
      {super.key,
      required this.titleText,
      required this.subTitleText,
      required this.fontSize});

  @override
  State<TextProfilUmkmDetail> createState() => _TextProfilUmkmDetailState();
}

class _TextProfilUmkmDetailState extends State<TextProfilUmkmDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleText,
          style: TextStyle(
              fontSize: widget.fontSize.toDouble() + 2,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          widget.subTitleText,
          style: TextStyle(fontSize: widget.fontSize.toDouble()),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
