import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettravel/widgets/recommended_places.dart';
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

  @override
  void initState() {
    super.initState();
    _fetchGetUserInfo();
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

  @override
  Widget build(BuildContext context) {
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
                      child: Image.asset("assets/images/profile.png",
                      height: 40,
                      width: 40,),
                    ),
                    SizedBox(width: 10,),
                    Center(child: Text("Bui Minh Quan", style: TextStyle(fontSize: 17),))
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
        padding: const EdgeInsets.all(14),
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Khám phá khắp \nViệt Nam !",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gợi ý cho bạn",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   // MaterialPageRoute(builder: (context) => const AllPlacesScreen()),
                    // );
                  },
                  child: const Text(
                      "Xem tất cả",
                      style: TextStyle(color: Colors.lightBlueAccent)
                  )
              )
            ],
          ),
          const SizedBox(height: 10),
          const RecommendedPlaces(),
        ],
      )
    );
  }
}
