import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ'),
      ),
      body: Center(
        child: Text(
          'Đây là màn hình trang chủ',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}