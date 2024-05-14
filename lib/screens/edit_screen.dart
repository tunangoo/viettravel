import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../widgets/edit_text_field.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

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
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
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
                width: 110,
                height: 110,
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/profile.png",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Your Name",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 30, // Override specific properties if needed
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Chỉnh sửa ảnh đại diện',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Họ và tên',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: EditTextField(
                  hintText: 'Họ và tên',
                  controller: _fullNameController,
                  keyboardType: TextInputType.text,
                ),
              ),
            ),

            const SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: EditTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                ),
              ),
            ),

            const SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Số điện thoại',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: EditTextField(
                  hintText: 'Số điện thoại',
                  controller: _phonenumberController,
                  keyboardType: TextInputType.text,
                ),
              ),
            ),

            const SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Địa chỉ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: EditTextField(
                  hintText: 'Địa chỉ',
                  controller: _locationController,
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}