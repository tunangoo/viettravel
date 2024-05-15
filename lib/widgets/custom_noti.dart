import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

void customNotiSuccess(BuildContext context, String message) {
  Flushbar(
    message: message,
    duration: Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.green,
    margin: EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
  ).show(context);
}

void customNotiError(BuildContext context, String message) {
  Flushbar(
    message: message,
    duration: Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.red,
    margin: EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
  ).show(context);
}