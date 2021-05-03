import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemScreen extends StatefulWidget {
  final imgPath, foodName, pricePerItem, heroTag;
  ItemScreen({this.imgPath, this.foodName, this.pricePerItem, this.heroTag});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  var netPrice = 0.0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Stack(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFE7D6A).withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 4.0),
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: Color(0xFFFE7D6A),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1,
                      right: 4,
                      child: Container(
                        height: 12.0,
                        width: 12.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "1",
                            style: GoogleFonts.notoSans(
                                fontSize: 7.0,
                                textStyle: TextStyle(
                                  color: Color(0xFFFE7D6A),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "SUPER",
              style: GoogleFonts.notoSans(
                fontSize: 27.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              widget.foodName.toString().toUpperCase(),
              style: GoogleFonts.notoSans(
                fontSize: 27.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.imgPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 4.0,
                              offset: Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 4.0,
                              offset: Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.restore,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                width: 125,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "\$" +
                        (int.parse(widget.pricePerItem) * quantity).toString(),
                    style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 40.0,
                      color: Color(0xFF5E6166),
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 225,
                decoration: BoxDecoration(
                  color: Color(0xFFFE7D6A),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 105,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Row(
                        children: [
                          IconButton(
                              iconSize: 17,
                              icon: Icon(Icons.remove),
                              color: Color(0xFFFE7D6A),
                              onPressed: () {
                                adjustQuantity("MINUS");
                              }),
                          Text(
                            quantity.toString(),
                            style: GoogleFonts.notoSans(
                              fontSize: 14.0,
                              color: Color(0xFFFE7D6A),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                              iconSize: 17,
                              icon: Icon(Icons.add),
                              color: Color(0xFFFE7D6A),
                              onPressed: () {
                                adjustQuantity("PLUS");
                              }),
                        ],
                      ),
                    ),
                    Text(
                      "Add to cart",
                      style: GoogleFonts.notoSans(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "FEATURED",
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 225,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _buildFoodTab("assets/cheese.png", "Sweet cheese",
                              "11", Color(0xFFFBD6F5)),
                          SizedBox(
                            width: 20.0,
                          ),
                          _buildFoodTab("assets/taco.png", "Tacos", "6",
                              Color(0xFFC2E3FE)),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          _buildFoodTab("assets/popcorn.png", "Sweet popcorn",
                              "11", Color(0xFFFBD6F5)),
                          SizedBox(
                            width: 20.0,
                          ),
                          _buildFoodTab("assets/sandwich.png", "Sandwich", "6",
                              Color(0xFFD7FADA)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildFoodTab(
      String imagePath, String foodName, String price, Color backgroundColor) {
    return Container(
      width: 210,
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(7.0),
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
              Text(
                "\$$price",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Color(0xFFF68D7F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}
