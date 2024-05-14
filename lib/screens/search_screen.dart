import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettravel/screens/search/Local_model.dart';
import 'package:viettravel/screens/all_places_screen.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final List<LocalModel> listLocal = [
    LocalModel(LocalImage: "assets/images/profile.png", LocalName: "anything", location: "here", price: 1000),
    LocalModel(LocalImage: "assets/images/profile.png", LocalName: "something", location: "here", price: 2000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AllPlacesScreen()),
                );},
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[150],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Tìm kiếm",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Địa điểm',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Column(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}