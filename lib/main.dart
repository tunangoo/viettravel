import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:viettravel/screens/edit_screen.dart';
import 'package:viettravel/screens/favorite_screen.dart';
import 'package:viettravel/screens/home_screen.dart';
import 'package:viettravel/screens/place_detail_screen.dart';
import 'package:viettravel/screens/profile_screen.dart';
import 'package:viettravel/screens/search_screen.dart';
import 'package:viettravel/screens/login_screen.dart';
import 'package:viettravel/helpers/app_constant.dart';
import 'package:viettravel/screens/all_places_screen.dart';
import 'package:viettravel/services/api_handle.dart';
import 'package:viettravel/models/user_model.dart';
import 'package:viettravel/test_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  // Track the states of each screen
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onTap(int index) {
    if (_currentIndex == index) {
      // If the current tab is tapped again, pop to first route
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appName),
          toolbarHeight: 0.0,
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: screens.asMap().map((index, screen) {
            return MapEntry(index, Navigator(
              key: _navigatorKeys[index],
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(
                  builder: (context) => screen,
                );
              },
            ));
          }).values.toList(),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: _onTap,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Iconify(Ri.home_smile_2_fill, color: Colors.blue),
              title: Text("Trang chủ"),
              selectedColor: Colors.blue,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Iconify(
                Ri.search_eye_fill,
                color: Colors.blue,
              ),
              title: Text("Tìm kiếm"),
              selectedColor: Colors.blue,
            ),

            /// Favorite
            SalomonBottomBarItem(
              icon: Iconify(Ri.heart_fill, color: Colors.blue),
              title: Text("Yêu thích"),
              selectedColor: Colors.blue,
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
