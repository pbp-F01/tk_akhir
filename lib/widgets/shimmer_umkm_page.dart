

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/models/review_umkm_model_new.dart';
import 'package:goumkm/models/umkm_model.dart';
import 'package:goumkm/pages/review_umkm/detail_review_umkm_page.dart';
import 'package:goumkm/widgets/rating_item.dart';

import '../theme.dart';
import '../utils/provider.dart';

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
