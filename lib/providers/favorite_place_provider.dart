import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../models/place_summary_model.dart';
import '../services/api_handle.dart';

class FavoritePlaceProvider extends ChangeNotifier {
  List<PlaceSummaryModel> _favoritePlace = [];

  List<PlaceSummaryModel> get favoritePlace => _favoritePlace;

  void setFavoritePlace(List<PlaceSummaryModel> favoritePlace) {
    _favoritePlace = favoritePlace;
    notifyListeners();
  }

  Future<void> fetchGetFavoritePlaces() async {
    try {
      final response = await getFavoritePlaces();
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        _favoritePlace = jsonData.map((item) => PlaceSummaryModel.fromJson(item)).toList();
      } else {
        // Handle error response
      }
    } catch (error) {
      // Handle error
    }
    notifyListeners();
  }
}