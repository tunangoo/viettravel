import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const LongButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
