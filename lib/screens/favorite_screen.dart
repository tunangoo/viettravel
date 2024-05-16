import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:viettravel/screens/place_detail_screen.dart';
import 'package:viettravel/services/api_handle.dart';
import 'package:viettravel/widgets/place_item_widget.dart';

import '../models/place_summary_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<PlaceSummaryModel> favoritePlaces = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchGetFavoritePlaces();
  }

  Future<void> _fetchGetFavoritePlaces() async {
    try {
      final response = await getFavoritePlaces();
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          favoritePlaces = jsonData.map((item) => PlaceSummaryModel.fromJson(item)).toList();
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
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Địa điểm yêu thích",style: Theme.of(context).textTheme.headlineMedium,)),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 16.0),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior(),
                    child: favoritePlaces.isEmpty ?? true
                    ? Center(
                      child: Text(
                        "Không có địa điểm yêu thích",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                      )
                    )
                   : GridView(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // mainAxisExtent: 280,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.55 // cái này sửa lại cho đúng tỉ lệ của máy pixel 3A API 34
                        ),
                        children: favoritePlaces.map(
                                (place) => PlaceItemWidget(
                                place: place,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: Duration(milliseconds: 500),
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return PlaceDetailScreen(placeId: place.placeId);
                                      },
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        const begin = Offset(1.0, 0.0);
                                        const end = Offset.zero;
                                        const curve = Curves.ease;

                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                }
                            )
                        ).toList(),
                      )
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}