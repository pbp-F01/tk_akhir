

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/models/review_umkm_model_new.dart';
import 'package:goumkm/models/umkm_model.dart';
import 'package:goumkm/pages/review_umkm/detail_review_umkm_page.dart';
import 'package:goumkm/widgets/rating_item.dart';

import '../theme.dart';
import '../utils/provider.dart';

class UmkmCard extends StatelessWidget{

  final UmkmModel umkmModel;
  final double rating;
  final int index;
  final int lastIndex;
  const UmkmCard({Key? key, required this.umkmModel, required this.rating, required this.index, required this.lastIndex,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () async {
        List<ReviewUmkmModelNew> listReview=[];
        var jsonMap =await GoUmkmProvider().getReviewUMKM();
        for(int i=0; i <jsonMap.length;i++){
          ReviewUmkmModelNew umkmModel = ReviewUmkmModelNew.fromJson(jsonMap[i]);
          listReview.add(umkmModel);
        }
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailReviewUmkmPage(listReviewUmkm: listReview.where((id) => id.fields!.umkm==umkmModel.pk).toList(), umkmModel: umkmModel, rating: rating.toStringAsFixed(1),
        )));
      },
      child: Stack(
        children: [
          Container(
            height:150.h,
            width: MediaQuery.of(context).size.width,
            margin:  EdgeInsets.only(bottom: lastIndex==index?0:16.h),
            child: CachedNetworkImage(
              imageUrl:umkmModel.fields!.foto!,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage( //image size fill
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error,size: 30.r,),
            ),
          ),
          Container(
            height: 150.h,
            width: MediaQuery.of(context).size.width,
            margin:  EdgeInsets.only(bottom: lastIndex==index?0:16),
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
            child: Padding(
              padding: EdgeInsets.only(left:16.w,right: 16.w,bottom: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      child: Text(umkmModel.fields!.nama!,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,color: whiteLightColor),maxLines: 1,)),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width:200.w,
                          child: Text(umkmModel.fields!.pemilik!,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: whiteLightColor),maxLines: 2,)),
                      Row(
                        children: [
                          Text("${rating.toStringAsFixed(1)}/5",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: whiteLightColor),maxLines: 2,),
                          SizedBox(width: 10.w,),
                          Image.asset(
                            "assets/star_yellow.png",width: 16.w,)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
