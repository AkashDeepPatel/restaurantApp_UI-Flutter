import 'package:emojis/burger_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emojis/food_tabs.dart';

class DrashboardScreen extends StatefulWidget {
  @override
  _DrashboardScreenState createState() => _DrashboardScreenState();
}

class _DrashboardScreenState extends State<DrashboardScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

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
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 3.0))
                      ],
                      color: Color(0xffc6e7fe),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/tuxedo.png"),
                          fit: BoxFit.contain)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "SEARCH FOR",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "RECIPES",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      fillColor: Colors.grey.withOpacity(0.5),
                      prefixIcon: Icon(
                        Icons.search,
                      )),
                )),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Recommended",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem(
                  "assets/burger.png",
                  "Hamburg",
                  "21",
                  Color(0xFFFFE9C6),
                  Color(0xFFDA9551),
                ),
                _buildListItem(
                  "assets/fries.png",
                  "Chips",
                  "15",
                  Color(0xFFC2E3FE),
                  Color(0xFF6A8CAA),
                ),
                _buildListItem(
                  "assets/doughnut.png",
                  "Donuts",
                  "15",
                  Color(0xFFFFE9C6),
                  Color(0xFFDA9551),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.5),
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(
                child: Text("FEATURED"),
              ),
              Tab(
                child: Text("COMBOS"),
              ),
              Tab(
                child: Text("FAVORITES"),
              ),
              Tab(
                child: Text("RECOMMENDED"),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: tabController,
              children: [
                FoodTabs(),
                FoodTabs(),
                FoodTabs(),
                FoodTabs(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildListItem(String imagePath, String foodName, String price,
      Color backgroundColor, Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ItemScreen(
                      heroTag: foodName,
                      foodName: foodName,
                      pricePerItem: price,
                      imgPath: imagePath,
                    )));
          },
          child: Container(
              height: 175.0,
              width: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: backgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: foodName,
                    child: Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          imagePath,
                          height: 50.0,
                          width: 50.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    foodName,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                      fontSize: 17.0,
                      color: textColor,
                    ),
                  ),
                ],
              ))),
    );
  }
}
