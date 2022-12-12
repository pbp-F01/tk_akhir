import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/theme.dart';
import 'package:goumkm/utils/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../../models/umkm_model.dart';

class RateUmkm extends StatefulWidget {
  const RateUmkm({Key? key, required this.umkmModel}) : super(key: key);
  final UmkmModel umkmModel;
  @override
  State<RateUmkm> createState() => _RateUmkmState();
}

class _RateUmkmState extends State<RateUmkm> {
  final List<int> rating = [
    1,
    2,
    3,
    4,
    5,
  ];
  var request;
  int? selectedValue;
  final TextEditingController reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    request= context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
              onTap: () async {

              },
              child: Text("Rate Umkm",style: whiteLightTextStyle.copyWith(fontSize: 18.sp,fontWeight: FontWeight.bold),)),
          leading: InkWell(
            onTap: ((){
              Navigator.pop(context);
            }),
            child: Icon(Icons.arrow_back,color: whiteLightColor,size:24)),
          backgroundColor: greenColor,
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'Rating',
                        style: blackTextStyle.copyWith(fontSize: 16.sp)
                      ),
                      items: rating
                          .map((item) =>
                          DropdownMenuItem<int>(
                            value: item,
                            child: Text(
                              item.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 140,
                      itemHeight: 40,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  TextField(
                    controller: reviewController,
                    decoration: InputDecoration(
                      label: Text(
                          'Comment',
                          style: blackTextStyle.copyWith(fontSize: 14.sp)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,

                  )
                ],
              ),
            )
        ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(bottom: 35.h,top:20.h,left: 27.w,right: 27.w ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(greenColor),
            ),
            onPressed: () async {
              await GoUmkmProvider().addReview(context, request, selectedValue.toString(), reviewController.text, widget.umkmModel.pk!.toString());
            },
            child: Text(
              'Rate Now',
              style: whiteTextStyle.copyWith(
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
