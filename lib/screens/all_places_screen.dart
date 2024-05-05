import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettravel/widgets/all_places.dart';

class AllPlacesScreen extends StatelessWidget {
  const AllPlacesScreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const BackButton(),
        ),
        title: Text(
          "Tất cả điểm đến",
              style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          const AllPlaces(),
        ],
      )
    );
  }

}