import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viettravel/helpers/app_constant.dart';
import 'package:viettravel/services/response_handle.dart';

Future<ResponseHandle> logIn(String username, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseApiUrl/auth/authenticate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password
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
