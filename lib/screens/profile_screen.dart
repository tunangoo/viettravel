import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:viettravel/screens/edit_screen.dart';
import 'package:viettravel/services/api_handle.dart';

import '../models/user_model.dart';
import '../widgets/profile_menu_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  void _updateUser(UserModel updatedUser) {
    setState(() {
      user = updatedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Trang cá nhân",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return EditScreen(user: user, updateUser: _updateUser,);
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            icon: Icon(Icons.border_color_outlined, color: Colors.lightBlue),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Center(
            //   child: SizedBox(
            //     width: 110,
            //     height: 110,
            //     child: ClipOval(
            //       child: widget.user.avatar != null
            //           ? Image.network(
            //         widget.user.avatar!,
            //         height: double.infinity,
            //         width: double.infinity,
            //         fit: BoxFit.cover,
            //       )
            //           : Image.asset(
            //         "assets/images/profile.png",
            //         height: double.infinity,
            //         width: double.infinity,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              height: screenHeight * 0.2,
              width: screenWidth,
              child: Image.asset(
                "assets/images/profile.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            Center(
              child: Text(
                user.fullName,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              user.email,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 12.0,
                      left: 12.0,
                    ),
                    height: 100,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Điểm thưởng',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "360",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 12.0,
                      left: 12.0,
                    ),
                    height: 100,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Số chuyến đi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "238",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 12.0,
                      left: 12.0,
                    ),
                    height: 100,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Danh sách',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "473",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ProfileMenuWidget(
              title: "Trang cá nhân",
              icon: Icons.perm_identity,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Đã đánh dấu",
              icon: Icons.bookmark_outline,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Vé đã đặt",
              icon: Icons.card_travel,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Cài đặt",
              icon: Icons.settings_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Phiên bản",
              icon: Icons.travel_explore_outlined,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}