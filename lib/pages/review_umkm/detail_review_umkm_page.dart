import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/models/review_umkm_model_new.dart';
import 'package:goumkm/models/umkm_model.dart';
import 'package:goumkm/theme.dart';
import 'package:goumkm/widgets/review_umkm_card.dart';
class DetailReviewUmkmPage extends StatefulWidget {
  const DetailReviewUmkmPage({Key? key, required this.listReviewUmkm, required this.umkmModel, required this.rating}) : super(key: key);
  final List<ReviewUmkmModelNew> listReviewUmkm;
  final UmkmModel umkmModel;
  final String rating;
  @override
  State<DetailReviewUmkmPage> createState() => _DetailReviewUmkmPageState();
}

class _DetailReviewUmkmPageState extends State<DetailReviewUmkmPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(alignment: Alignment.topCenter, children: [
          Column(
            children: [
              Stack(children: [
                Container(
                  height: 170.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                          widget.umkmModel.fields!.foto!),
                    ),
                  ),
                  child: AppBar(
                    elevation: 0,
                    leading: InkWell(
                        onTap: ((){
                          Navigator.pop(context);
                        }),
                        child: Icon(Icons.arrow_back,color: Colors.white,size:24)),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Positioned(
                  top: 90.h,
                  left: 20.w,
                  child: Text(
                    widget.umkmModel.fields!.nama!,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.white),
                  ),
                ),
              ]),
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.listReviewUmkm.length} Review",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.only(top: 20.h),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: widget.listReviewUmkm.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 8.h),
                            padding: EdgeInsets.all(10.h.w),
                            decoration: BoxDecoration(
                              color: whiteLightColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.r),
                              ),
                            ),
                            child: ReviewUmkmCard(reviewUMKM: widget.listReviewUmkm[index],)
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 145.h,
            child: Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset:
                    const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    SizedBox(width: 20.w,),
                    Column(
                      children: [
                        Text(
                          "Pemilik",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Icon(Icons.person,size: 20,),
                            SizedBox(width: 5.w),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                widget.umkmModel.fields!.pemilik!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp,color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    const VerticalDivider(
                      endIndent: 10,
                      color: Colors.grey,
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          "Rating",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Image.asset(
                              "assets/star_yellow.png",width: 16.w,),
                            SizedBox(width: 5.w),
                            Text(
                              widget.rating,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp,color: greenColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ]
        ),
      ),
    );
  }
}