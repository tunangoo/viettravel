import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yêu thích'),
      ),
      body: Center(
        child: Text(
          'Đây là màn hình yêu thích',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}