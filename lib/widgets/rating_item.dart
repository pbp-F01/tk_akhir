import 'package:flutter/material.dart';

class RatingItem extends StatefulWidget{
final double index;
final double ratingItem;
RatingItem(this.index, this.ratingItem,);

  @override
  State<RatingItem> createState() => _RatingItemState();
}

class _RatingItemState extends State<RatingItem> {
  String image="";
  @override
  Widget build(BuildContext context) {
    if(widget.ratingItem>=widget.index){
      image='assets/star_yellow.png';
    }
   else{
      if(widget.ratingItem>=widget.index-0.5){
        image='assets/star_yellow_grey.png';
      }else{
        image='assets/star_grey.png';
      }
    }
    return Image.asset(
      image,width: 20,);
  }
}
