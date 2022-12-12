import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/models/review_umkm_model_new.dart';
import 'package:goumkm/models/umkm_model.dart';
import 'package:goumkm/theme.dart';
import 'package:goumkm/widgets/shimmer_umkm_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/review_umkm_model.dart';
import '../../utils/provider.dart';
import '../../widgets/review_umkm_card.dart';
import '../../widgets/umkm_card.dart';
class ReviewUmkmPage extends StatefulWidget {
  const ReviewUmkmPage({Key? key}) : super(key: key);

  @override
  State<ReviewUmkmPage> createState() => _ReviewUmkmPageState();
}

class _ReviewUmkmPageState extends State<ReviewUmkmPage> {
  List<ReviewUmkmModelNew> listReview=[];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(left:12.w,right: 12.w,top: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("GoUMKM - Review UMKM",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(height: 20.h,),
              Expanded(
                child: FutureBuilder<List<UmkmModel>>(
                  future: getDataUmkm(),
                  builder: (context, snapshot){
                    if(snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            double sum=0;
                            for (int i = 0; i < listReview.where((id) => id.fields!.umkm==snapshot.data![index].pk).length; i++){
                              sum += listReview.where((id) => id.fields!.umkm==snapshot.data![index].pk).toList()[i].fields!.rating!;
                            }
                            UmkmModel list=snapshot.data![index];
                            return UmkmCard(umkmModel: list, rating: sum/listReview.where((id) => id.fields!.umkm==snapshot.data![index].pk).length, index: index, lastIndex: snapshot.data!.length,);
                            });
                    }else{
                      return Shimmer.fromColors(
                          baseColor: Colors.black12,
                          highlightColor: Colors.white,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return ShimmerUmkmCard();
                            },
                          ));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
  Future<List<UmkmModel>>getDataUmkm() async{
    List<UmkmModel> listUmkm=[];
    var jsonMap =await GoUmkmProvider().getUmkm();
    for(int i=0; i <jsonMap.length;i++){
      UmkmModel umkmModel = UmkmModel.fromJson(jsonMap[i]);
      listUmkm.add(umkmModel);
    }
    var jsonMap2 =await GoUmkmProvider().getReviewUMKM();
    for(int i=0; i <jsonMap2.length;i++) {
      ReviewUmkmModelNew reviewUmkmModelNew = ReviewUmkmModelNew.fromJson(jsonMap2[i]);
      listReview.add(reviewUmkmModelNew);
    }
    return listUmkm;
  }
}
