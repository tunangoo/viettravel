import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viettravel/helpers/number_format.dart';
import 'package:viettravel/providers/user_provider.dart';
import 'package:viettravel/screens/edit_screen.dart';
import 'package:viettravel/screens/ticket_screen.dart';

import '../helpers/navigator_help.dart';
import '../widgets/profile_menu_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var user = Provider.of<UserProvider>(context).user;

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
              navigatorPush(
                context,
                EditScreen(),
              );
            },
            icon: Icon(Icons.border_color_outlined, color: Colors.lightBlue),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                          "0",
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
                            'Số dư ví',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '${convertToVND(user.balance ?? 0)}₫',
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
              title: "Ví Viettravel",
              icon: Icons.wallet_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Vé đã đặt",
              icon: Icons.confirmation_number_outlined,
              onPress: () {
                navigatorPush(context, TicketScreen());
              },
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
