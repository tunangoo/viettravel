import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin cá nhân'),
      ),
      body: Center(
        child: Text(
          'Đây là màn hình thông tin cá nhân',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}