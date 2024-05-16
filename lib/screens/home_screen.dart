import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:viettravel/screens/free_place_screen.dart';
import 'package:viettravel/screens/recommend_place_screen.dart';
import 'package:viettravel/widgets/place_item_widget.dart';
import '../helpers/navigator_help.dart';
import '../models/place_summary_model.dart';
import '../models/user_model.dart';
import 'package:viettravel/services/api_handle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var user;
  List<PlaceSummaryModel> recommendPlaces = [];
  List<PlaceSummaryModel> freePlaces = [];

  @override
  void initState() {
    super.initState();
    _fetchGetUserInfo();
    _fetchGetRecommendPlaces();
    _fetchGetFreePlaces();
  }

  Future<void> _fetchGetUserInfo() async {
    try {
      final response = await getUserInfo();
      if (response.statusCode == 200) {
        setState(() {
          user = UserModel.fromJson(response.body);
        });
      } else {
        // Handle error response
      }
    } catch (error) {
      // Handle error
    }
  }

  Future<void> _fetchGetRecommendPlaces() async {
    try {
      final response = await getRecommendPlaces();
      if(response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          recommendPlaces = jsonData.map((item) => PlaceSummaryModel.fromJson(item)).toList();
        });
      } else {
        // Handle error response
      }
    } catch (error) {
      // Handle error
    }
  }

  Future<void> _fetchGetFreePlaces() async {
    try {
      final response = await getFreePlaces();
      if(response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          freePlaces = jsonData.map((item) => PlaceSummaryModel.fromJson(item)).toList();
        });
      } else {
        // Handle error response
      }
    } catch (error) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Container(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(23), color: Colors.grey[300]),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/images/profile.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Center(
                      child: Text(
                        (user != null) ? user!.fullName : 'Người dùng',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined, size: 30,),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0))
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 14),
            child: Text(
              "Khám phá khắp \nViệt Nam!",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gợi ý cho bạn",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      navigatorPush(
                        context,
                        RecommendPlaceScreen(recommendPlaces: recommendPlaces),
                      );
                    },
                    child: const Text(
                        "Xem tất cả",
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 15,
                        ),
                    )
                )
              ],
           ),
          ),
          Container(
            height: 330, // Chiều cao cố định cho danh sách ngang
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: recommendPlaces.take(5).map(
                (place) => Container(
                  width: screenWidth * 0.57,
                  height: double.infinity,
                  child: PlaceItemWidget(
                    place: place,
                  ),
                ),
              ).toList(),
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Địa điểm miễn phí",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      navigatorPush(
                        context,
                        FreePlaceScreen(freePlaces: freePlaces),
                      );
                    },
                    child: const Text(
                      "Xem tất cả",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 15,
                      ),
                    )
                )
              ],
            ),
          ),
          Container(
            height: 330, // Chiều cao cố định cho danh sách ngang
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: freePlaces.take(5).map(
                (place) => Container(
                  width: screenWidth * 0.57,
                  height: double.infinity,
                  child: PlaceItemWidget(
                    place: place,
                  ),
                ),
              ).toList(),
            ),
          ),
        ],
      )
    );
  }
}
