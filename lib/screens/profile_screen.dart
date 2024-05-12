import 'package:flutter/material.dart';
import 'package:viettravel/screens/edit_screen.dart';

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
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
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
                    return EditScreen();
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
            icon: Icon(Icons.border_color_outlined),
            color: Colors.blue,
            padding: EdgeInsets.only(right: 10),
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

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textcolor
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        padding: EdgeInsets.only(left: 12.0),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium,),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: const Icon(Icons.arrow_forward_ios, size: 18.0, color: Colors.grey,),
      ) : null,
    );
  }
}
