import 'package:flutter/material.dart';
import 'profile/edit_screen.dart';
import 'package:viettravel/widgets/profile_menu_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trang cá nhân",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditScreen()),
              );
            },
            icon: Icon(
              Icons.border_color_outlined,
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/profile.png",
                      height: double.maxFinite,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text("Your Name", style: Theme.of(context).textTheme.headlineMedium),
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
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          Text(
                            "Số điểm",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
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
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          Text(
                            "Số điểm",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
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
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          Text(
                            "Số điểm",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ProfileMenuWidget(title: "Trang cá nhân", icon: Icons.perm_identity, onPress: (){},),
              ProfileMenuWidget(title: "Đã đánh dấu", icon: Icons.bookmark, onPress: (){},),
              ProfileMenuWidget(title: "Chuyến đi trước", icon: Icons.card_travel, onPress: (){},),
              ProfileMenuWidget(title: "Cài đặt", icon: Icons.settings_rounded, onPress: (){},),
              ProfileMenuWidget(title: "Phiên bản", icon: Icons.travel_explore, onPress: (){},),
            ],
          )
      ),
    );
  }
}


