import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tìm kiếm'),
      ),
      body: Center(
        child: Text(
          'Đây là màn hình tìm kiếm',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}