
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerUmkmCard extends StatelessWidget{

  const ShimmerUmkmCard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          height:150.h,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
        Container(
          height:150.h,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.transparent,
                Color(0xC7000000),
              ],
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
      ],
    );
  }
}
