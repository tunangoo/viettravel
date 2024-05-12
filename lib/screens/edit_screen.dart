import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

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
          "Thông tin cá nhân",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Lưu',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Center(
                child: SizedBox(
                  width: 180,
                  height: 180,
                  // child: CircleAvatar(
                  //   maxRadius: 32.0,
                  //   child: Image.asset(
                  //     "assets/images/profile.png",
                  //     width: 64.0,
                  //   ),
                  // ),
                ),
              ),
            const SizedBox(height: 10),
            Center(child: Text("Your Name", style: Theme.of(context).textTheme.headlineMedium)),
            TextButton(
              onPressed: () {},
              child: Text(
                'Chỉnh sửa ảnh đại diện',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Họ và tên',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Ngô Văn Tuân",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                ),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 7),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Số điện thoại',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "0",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                ),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 7),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Địa chỉ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                ),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}