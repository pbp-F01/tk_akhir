

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/models/review_umkm_model.dart';
import 'package:goumkm/models/umkm_model.dart';
import 'package:goumkm/pages/review_umkm/detail_review_umkm_page.dart';
import 'package:goumkm/pages/review_umkm/rate_umkm_page.dart';
import 'package:goumkm/widgets/rating_item.dart';

import '../theme.dart';
import '../utils/provider.dart';

class UmkmCard extends StatelessWidget{

  final UmkmModel umkmModel;
  final double rating;
  final int index;
  final int lastIndex;
  final String role;
  const UmkmCard({Key? key, required this.umkmModel, required this.rating, required this.index, required this.lastIndex, required this.role,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        List<ReviewUmkmModel> listReview=[];
        var jsonMap =await GoUmkmProvider().getReviewUMKM();
        for(int i=0; i <jsonMap.length;i++){
          ReviewUmkmModel umkmModel = ReviewUmkmModel.fromJson(jsonMap[i]);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width:200.w,
                          child: Text(umkmModel.fields!.nama!,style: whiteLightTextStyle.copyWith(fontSize: 20.sp,fontWeight: FontWeight.w700,),maxLines: 2,)),
                      Row(
                        children: [
                          Text("${rating==0?0:rating.toStringAsFixed(1)}/5",style: whiteLightTextStyle.copyWith(fontSize: 16.sp,),maxLines: 2,),
                          SizedBox(width: 10.w,),
                          Image.asset(
                            "assets/star_yellow.png",width: 16.w,)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width:160.w,
                          child: Text(umkmModel.fields!.pemilik!,style: whiteLightTextStyle.copyWith(fontSize: 16.sp,),maxLines: 2,)),
                      Visibility(
                        visible: role=="K"?true:false,
                        child: TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RateUmkm(umkmModel: umkmModel,)));
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: greenColor,
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          ),
                          child:Row(
                            children: [
                              Text("Rate Now",style: whiteLightTextStyle.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w700,),maxLines: 1,),
                              SizedBox(width: 10.w,),
                              Icon(Icons.star_rate,color: Colors.orange,size: 20,)
                            ],
                          ),
                        ),
                      ),
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
