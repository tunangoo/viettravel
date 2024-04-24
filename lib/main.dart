import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:viettravel/screen/favorite_screen.dart';
import 'package:viettravel/screen/home_screen.dart';
import 'package:viettravel/screen/profile_screen.dart';
import 'package:viettravel/screen/search_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  static final title = 'VietTravel';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          toolbarHeight: 0.0,
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              // icon: Icon(Iconsax.home_1),
              icon: const Iconify(Ri.home_smile_2_fill, color: Colors.purple),
              title: Text("Trang chủ"),
              selectedColor: Colors.purple,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Iconify(
                Ri.search_eye_fill,
                color: Colors.orange,
              ),
              title: Text("Tìm kiếm"),
              selectedColor: Colors.orange,
            ),

            /// Favorite
            SalomonBottomBarItem(
              icon: Iconify(Ri.heart_fill, color: Colors.red),
              title: Text("Yêu thích"),
              selectedColor: Colors.red,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Iconify(Ri.user_5_fill, color: Colors.blue),
              title: Text("Cá nhân"),
              selectedColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}