import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/models/review_umkm_model_new.dart';
import 'package:goumkm/widgets/rating_item.dart';
import 'package:intl/intl.dart';

import '../models/review_umkm_model.dart';
import '../theme.dart';

class ReviewUmkmCard extends StatefulWidget{

  final ReviewUmkmModelNew reviewUMKM;
  const ReviewUmkmCard({Key? key, required this.reviewUMKM,}) : super(key: key);

  @override
  State<ReviewUmkmCard> createState() => _ReviewUmkmCardState();
}

class _ReviewUmkmCardState extends State<ReviewUmkmCard> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var parsedDate = DateTime.parse(widget.reviewUMKM.fields!.reviewDate!);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            'assets/logo_umkm.png',
            height: 40.h,
          ),
        ),
        VerticalDivider(
          endIndent: 10,
          color: Colors.black,
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(parsedDate),
                style: TextStyle(fontSize: 14.sp,color: Colors.black),
                maxLines: 4,),
              SizedBox(height: 10.h,),
              Text(widget.reviewUMKM.fields!.comment!,
                maxLines: 10,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Text("${widget.reviewUMKM.fields!.rating!}",
                    style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: greenColor),),
                  Text("/5",
                    style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: greenColor),),
                  SizedBox(width: 10.w,),
                  Row(
                      children: [1,2,3,4,5].map((index){
                        return Container(
                          margin: EdgeInsets.only(left: 2),
                          child: RatingItem(
                              index.toDouble(),widget.reviewUMKM.fields!.rating!.toDouble()
                          ),
                        );
                      }).toList()
                  ),
                ],
              )

            ],
          ),
        ),

      ],
    );
  }
}