import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:viettravel/providers/favorite_place_provider.dart';
import 'package:viettravel/services/api_handle.dart';
import 'package:viettravel/widgets/place_item_widget.dart';

import '../models/place_summary_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<PlaceSummaryModel> favoritePlaces = Provider.of<FavoritePlaceProvider>(context, listen: true).favoritePlace;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Địa điểm yêu thích",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
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
                    child: favoritePlaces.length == 0 ?? true
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
                            childAspectRatio: 0.57
                        ),
                        children: favoritePlaces.map(
                                (place) => PlaceItemWidget(
                                place: place,
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