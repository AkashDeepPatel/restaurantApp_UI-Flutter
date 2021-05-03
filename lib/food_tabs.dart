import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTabs extends StatefulWidget {
  @override
  _FoodTabsState createState() => _FoodTabsState();
}

class _FoodTabsState extends State<FoodTabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListIItemForTabBar(
              "assets/hotdog.png", "Delicious hot dog", 4.0, "6", "18"),
          _buildListIItemForTabBar(
              "assets/pizza.png", "Cheese pizza", 5.0, "12", "20"),
        ],
      ),
    );
  }

  Padding _buildListIItemForTabBar(
    String imagePath,
    String foodName,
    rating,
    String discountedPrice,
    String price,
  ) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 210.0,
            child: Row(
              children: [
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE3DF),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                    SmoothStarRating(
                      allowHalfRating: false,
                      starCount: rating.toInt(),
                      rating: rating,
                      color: Color(0xFFFFD143),
                      borderColor: Color(0xFFFFD143),
                      size: 15.0,
                      spacing: 0.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$$discountedPrice",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            color: Color(0xFFF68D7F),
                          ),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          "\$$price",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          FloatingActionButton(
            // heroTag: foodName,
            mini: true,
            onPressed: () {},
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xFFFE7D6A),
          ),
        ],
      ),
    );
  }
}
