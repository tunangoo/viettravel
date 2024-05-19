import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:viettravel/providers/favorite_place_provider.dart';
import 'package:viettravel/providers/user_provider.dart';
import 'package:viettravel/screens/favorite_screen.dart';
import 'package:viettravel/screens/home_screen.dart';
import 'package:viettravel/screens/profile_screen.dart';
import 'package:viettravel/screens/search_screen.dart';
import 'package:viettravel/screens/login_screen.dart';
import 'package:viettravel/helpers/app_constant.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => FavoritePlaceProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
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

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fetchUserInfo();
    Provider.of<FavoritePlaceProvider>(context, listen: false).fetchGetFavoritePlaces();
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
          children: screens,
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Iconify(
                Ri.home_7_fill,
                color: Colors.blue
              ),
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
              icon: Iconify(
                Ri.heart_fill,
                color: Colors.blue
              ),
              title: Text("Yêu thích"),
              selectedColor: Colors.blue,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Iconify(
                Ri.user_3_fill,
                color: Colors.blue
              ),
              title: Text("Cá nhân"),
              selectedColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
