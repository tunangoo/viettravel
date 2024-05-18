import 'package:flutter/material.dart';
import 'package:viettravel/services/api_handle.dart';
import 'package:viettravel/widgets/custom_text_field.dart';
import '../models/user_model.dart';
import 'package:viettravel/widgets/custom_noti.dart';

class EditScreen extends StatefulWidget {
  final UserModel user;
  final Function(UserModel) updateUser;

  const EditScreen({
    Key? key,
    required this.user,
    required this.updateUser,
  }) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  initState() {
    super.initState();
    setState(() {
      _fullNameController.text = widget.user.fullName;
      _emailController.text = widget.user.email;
      _phoneNumberController.text = widget.user.phoneNumber ?? "";
      _addressController.text = widget.user.address ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
            onPressed: () {
              //call api cập nhật thông tin
              UserModel updatedUser = UserModel(
                  fullName: _fullNameController.text,
                  phoneNumber: _phoneNumberController.text,
                  email: _emailController.text,
                  address: _addressController.text,
                  balance: widget.user.balance,
              );
              updateUserInfo(
                  updatedUser
              ).then((response) {
                if (response.statusCode == 200) {
                  widget.user.fullName = _fullNameController.text;
                  widget.user.phoneNumber = _phoneNumberController.text;
                  widget.user.email = _emailController.text;
                  widget.user.address = _addressController.text;
                  widget.updateUser(widget.user);
                  customNotiSuccess(context, response.message);
                } else {
                  customNotiError(context, response.message);
                }
              });
            },
            child: Text(
              'Cập nhật',
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
            Container(
              height: screenHeight * 0.2,
              width: screenWidth,
              child: Image.asset(
                "assets/images/profile.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            // Center(
            //   child: SizedBox(
            //     width: screenWidth*0.3,
            //     height: screenHeight,
            //     child: ClipOval(
            //       child: Image.asset(
            //         "assets/images/profile.png",
            //         height: double.infinity,
            //         width: double.infinity,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Text(
            //     "Your Name",
            //     style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            //       fontSize: 30, // Override specific properties if needed
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.center,
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
                child: CustomTextField(
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
                child: CustomTextField(
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
                child: CustomTextField(
                  hintText: 'Số điện thoại',
                  controller: _phoneNumberController,
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
                child: CustomTextField(
                  hintText: 'Địa chỉ',
                  controller: _addressController,
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