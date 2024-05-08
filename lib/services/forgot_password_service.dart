import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viettravel/helpers/app_constant.dart';
import 'package:viettravel/services/response_handle.dart';

Future<ResponseHandle> forgotPassword(String username, String email) async {
  print(username);
  print(email);
  try {
    final response = await http.patch(
      Uri.parse('$baseApiUrl/auth/reset_password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
      }),
    );
    ResponseHandle responseHandle = ResponseHandle.fromHttpResponse(response);
    return responseHandle;
  } catch (error) {
    return ResponseHandle(
      statusCode: 500,
      message: 'Có lỗi xảy ra',
    );
  }
}
