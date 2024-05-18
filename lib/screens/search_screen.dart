import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:viettravel/helpers/search_filter.dart';

import '../models/place_summary_model.dart';
import '../services/api_handle.dart';
import '../widgets/place_item_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<PlaceSummaryModel> places = [];
  List<PlaceSummaryModel> placeResult = [];
  bool isSearch = false;
  List<String> suggestions = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchGetAllPlaces();
    isSearch = false;
  }

  Future<void> _fetchGetAllPlaces() async {
    try {
      final response = await getAllPlaces();
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        setState(() {
          places = jsonData.map((item) => PlaceSummaryModel.fromJson(item)).toList();
        });
      } else {
        // Handle error response
      }
    } catch (error) {
      // Handle error
    }
  }

  void onPressSearch() {
    String keyword = searchController.text;
    FocusScope.of(context).unfocus();
    setState(() {
      isSearch = true;
      suggestions = [];
      placeResult = searchResult(places, keyword);
      print(placeResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tìm kiếm",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              onTap: () {
                setState(() {
                  isSearch = false;
                  suggestions = searchSuggestion(places.map((place) => place.name).toList(), searchController.text);
                });
              },
              onChanged: (text) {
                setState(() {
                  isSearch = false;
                  suggestions = searchSuggestion(places.map((place) => place.name).toList(), text);
                });
              },
              onSubmitted: (text) {
                onPressSearch();
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[150],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                hintText: "Tìm kiếm tên địa điểm",
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    onPressSearch();
                  },
                ),
              ),
            ),
            if (suggestions.isNotEmpty)
              SizedBox(
                height: 270,
                child: ListView.builder(
                  itemCount: suggestions.take(5).length,
                  itemBuilder: (context, index) {
                    final suggestion = suggestions[index];
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 15),
                      title: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSearch = false;
                            searchController.text = suggestion;
                            suggestions = searchSuggestion(places.map((place) => place.name).toList(), suggestion);
                          });
                        },
                        child: Text(
                          suggestion,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            isSearch = false;
                            searchController.text = suggestion;
                          });
                          onPressSearch();
                        },
                      ),
                    );
                  },
                ),
              ),
            if (isSearch)
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '  Địa điểm liên quan',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.57,
                          ),
                          itemCount: placeResult.length,
                          itemBuilder: (context, index) {
                            return PlaceItemWidget(place: placeResult[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
