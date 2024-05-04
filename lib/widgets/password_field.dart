import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final VoidCallback toggleObscureText;

  const PasswordField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.keyboardType,
    required this.toggleObscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(fontSize: 18, color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: obscureText
            ? IconButton(
          icon: Icon(Icons.visibility),
          onPressed: toggleObscureText,
        )
            : IconButton(
          icon: Icon(Icons.visibility_off),
          onPressed: toggleObscureText,
        ),
      ),
    );
  }
}
