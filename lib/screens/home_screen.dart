import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettravel/screens/all_places_screen.dart';
import 'package:viettravel/widgets/recommended_places.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Xin chào"),
            Text(
                "Tên người dùng",
              style: Theme.of(context).textTheme.labelMedium,
            )
          ]
        ),
        actions: [
          IconButton(onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
          ),
          Padding(padding: EdgeInsets.all(8.0))
        ],

      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                  "Khám phá khắp \n Việt Nam !",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          const SizedBox(height: 85),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Gợi ý cho bạn",
                  style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllPlacesScreen()),
                    );
                  },
                  child: const Text(
                      "Xem tất cả",
                      style: TextStyle(color: Colors.lightBlueAccent)
                  )
              )
            ],
          ),
          const SizedBox(height: 20),
          const RecommendedPlaces(),
        ],
      )
    );
  }
}