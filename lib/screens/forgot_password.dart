// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettravel/services/forgot_password_service.dart';
import 'package:viettravel/widgets/custom_text_field.dart';
import 'package:viettravel/widgets/long_button.dart';
import 'package:viettravel/helpers/validate.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  String _usernameError = '';
  String _emailError = '';
  String _getNewPasswordError = '';

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
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  'Quên mật khẩu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  'Vui lòng nhập tên đăng nhập và email đã đăng ký',
                  style: TextStyle(
                    color: Colors.grey[20],
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                  ),
                ),
              ),Padding(
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
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: LongButton(
                    buttonName: 'Cấp mật khẩu mới',
                    onPressed: () {
                      setState(() {
                        _usernameError = validateUsername(_usernameController.text);
                        if(!validateTextField(_emailController.text)) {
                          _emailError = 'Email không được để trống';
                        } else {
                          _emailError = '';
                        }
                      });
                      if(_emailError.isEmpty && _usernameError.isEmpty) {
                        forgotPassword(
                            _usernameController.text,
                            _emailController.text
                        ).then((response) {
                          if(response.statusCode == 200) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Cấp mật khẩu mới thành công, mật khẩu mới đã được gửi về email đăng ký'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Đóng dialog
                                        Navigator.pop(context); // Quay về màn hình trước đó (màn hình đăng nhập)
                                      },
                                      child: Text('Xác nhận'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            setState(() {
                              _getNewPasswordError = "Tên đăng nhập hoặc email không đúng";
                            });
                          }
                        });
                      }
                    },
                  )
              ),
              if(_getNewPasswordError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      _getNewPasswordError,
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
