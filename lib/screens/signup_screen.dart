// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:viettravel/widgets/custom_text_field.dart';
import 'package:viettravel/widgets/password_field.dart';
import 'package:viettravel/widgets/long_button.dart';
import 'package:viettravel/helpers/validate.dart';
import 'package:viettravel/services/signup_service.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _obscureText = true;
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _fullNameError = '';
  String _emailError = '';
  String _usernameError = '';
  String _passwordError = '';
  String _signupError = '';

  void toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  'Đăng ký ngay',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomTextField(
                    hintText: 'Họ và tên',
                    controller: _fullNameController,
                    keyboardType: TextInputType.text,
                ),
              ),
              if (_fullNameError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _fullNameError,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: CustomTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                ),
              ),
              if (_emailError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _emailError,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: CustomTextField(
                  hintText: 'Tên đăng nhập',
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                ),
              ),
              if (_usernameError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _usernameError,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 9),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '* Mật khẩu tối thiểu 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt.',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              if (_passwordError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _passwordError,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: LongButton(
                  buttonName: 'Đăng ký',
                  onPressed: () {
                    setState(() {
                      if(!validateTextField(_fullNameController.text)) {
                        _fullNameError = 'Họ và tên không được để trống';
                      } else {
                        _fullNameError = '';
                      }
                      if(!validateTextField(_emailController.text)) {
                        _emailError = 'Email không được để trống';
                      } else {
                        _emailError = '';
                      }
                      _usernameError = validateUsername(_usernameController.text);
                      _passwordError = validatePassword(_passwordController.text);
                    });
                    if(_fullNameError.isEmpty && _emailError.isEmpty
                        && _usernameError.isEmpty && _passwordError.isEmpty) {
                      signUp(
                          _fullNameController.text,
                          _emailController.text,
                          _usernameController.text,
                          _passwordController.text
                      ).then((response) {
                        if(response.statusCode == 200) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Đăng ký thành công'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Đóng dialog
                                      Navigator.pop(context); // Quay về màn hình trước đó (màn hình đăng nhập)
                                    },
                                    child: Text('Oke'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          setState(() {
                            _signupError = response.message;
                          });
                        }
                      });
                    }
                  },
                )
              ),
              if(_signupError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      _signupError,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
