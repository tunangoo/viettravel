import 'package:flutter/material.dart';
import 'package:viettravel/helpers/app_constant.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:viettravel/screens/forgot_password.dart';
import 'package:viettravel/screens/signup_screen.dart';
import 'package:viettravel/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/navigator_help.dart';
import '../main.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _obscureText = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _loginError = '';
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
    checkLoginStatus();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void checkLoginStatus() async {
    final String? savedUsername = prefs?.getString('username');
    final String? savedPassword = prefs?.getString('password');
    if (savedUsername != null && savedPassword != null) {
      // Nếu có tên người dùng và mật khẩu đã lưu, thực hiện gọi API login
      logIn(savedUsername, savedPassword).then((response) {
        if (response.statusCode == 200) {
          final String accessToken = response.body['accessToken'];
          prefs?.setString('accessToken', accessToken);
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MyApp()));
        } else {
          setState(() {
            _loginError = "Tên đăng nhập hoặc mật khẩu không chính xác";
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Text(
                    appName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomTextField(
                    hintText: 'Tên đăng nhập',
                    controller: _usernameController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: PasswordField(
                        hintText: 'Mật khẩu',
                        obscureText: _obscureText,
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        toggleObscureText: toggleObscureText,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: GestureDetector(
                      onTap: () {
                        navigatorPush(
                          context,
                          ForgotPasswordScreen(),
                        );
                      },
                      child: Text(
                        'Quên mật khẩu?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                          logIn(
                            _usernameController.text,
                            _passwordController.text
                          ).then((response) {
                            if(response.statusCode == 200) {
                              setState(() {
                                _loginError = "";
                              });
                              prefs?.setString('username', _usernameController.text);
                              prefs?.setString('password', _passwordController.text);
                              prefs?.setString('accessToken', response.body['accessToken']);
                              accessToken = response.body['accessToken'];
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MyApp())); // Truyền giá trị _currentIndex = 0
                            } else {
                              setState(() {
                                _loginError = "Tên đăng nhâp hoặc mật khẩu không chính xác";
                              });
                            }
                         });
                        } else {
                          setState(() {
                            _loginError = "Tên đăng nhâp hoặc mật khẩu không được để trống";
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                if(_loginError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        _loginError,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bạn chưa có tài khoản? ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        navigatorPush(
                          context,
                          SignupScreen(),
                        );
                      },
                      child: Text(
                        'Đăng ký ngay',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Hoặc liên kết',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Xử lý khi người dùng nhấn vào liên kết Facebook
                        },
                        icon: Iconify(
                          Ri.facebook_fill,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Xử lý khi người dùng nhấn vào liên kết Instagram
                        },
                        icon: Iconify(
                          Ri.instagram_fill,
                          color: Colors.orange,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Xử lý khi người dùng nhấn vào liên kết Twitter
                        },
                        icon: Iconify(
                          Ri.twitter_fill,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
