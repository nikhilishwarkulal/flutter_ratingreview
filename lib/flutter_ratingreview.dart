library flutter_ratingreview;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RatingReviewIndicator extends StatelessWidget {

  final double startOneValue,starTwoValue,starThreeValue,starFourValue,starFiveValue;
  final String starRating;
  final Color headerTextColor,starRatingTextColor,barBackgroundColor,barTintColor, indexingColor;
  final String headerText;
  final String fontName;
  RatingReviewIndicator({
    this.starRating,this.starFiveValue,this.starFourValue,this.starThreeValue,this.startOneValue,this.starTwoValue,
    this.headerText,this.headerTextColor,this.fontName,this.starRatingTextColor,this.barBackgroundColor,this.barTintColor,this.indexingColor});
  
  @override
  Widget build(BuildContext context) {
    return getStarMap();
  }

  Widget getStarMap(){

    return Container(
      height: 250,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Spacer(),
                getHorizontalBar(percentage: startOneValue ?? 30,index: 1),
                Spacer(),
                getHorizontalBar(percentage: starTwoValue ?? 40,index: 2),
                Spacer(),
                getHorizontalBar(percentage: starThreeValue ?? 60,index: 3),
                Spacer(),
                getHorizontalBar(percentage: starFourValue ?? 75,index: 4),
                Spacer(),
                getHorizontalBar(percentage: starFiveValue ?? 35,index: 5),
                Spacer(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  headerText ?? "Ratings",
                  style: TextStyle(
                      fontFamily: fontName ?? "",
                      fontSize: 18,
                      color: headerTextColor ?? Color(0xFF707070),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  starRating ?? "5.0",
                  style: TextStyle(
                      fontFamily: fontName ?? "",
                      fontSize: 70,
                      color: starRatingTextColor ?? Color(0xFF120E21),
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
  Widget getHorizontalBar({double percentage,int index}){
    return Column(

      children: [
        Spacer(),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: 30,
                height: 180,
                decoration: BoxDecoration(
                    color: barBackgroundColor ?? Color(0xFFFBEAFF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    )
                ),

              )
              ,
              Container(
                  width: 30,
                  height: percentage == null ? 100 : percentage * 1.8,

                  decoration: BoxDecoration(
                      color: barTintColor ?? Color(0xFFFBEAFF),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      )
                  )
              ),

            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text(
            "" + index.toString(),
            style: TextStyle(
                fontFamily: fontName ?? "",
                fontSize: 18,
                color: indexingColor ?? Color(0xFF120E21),
                fontWeight: FontWeight.w500),
          ),
        ),
        Spacer(),
      ],
    );
  }
}