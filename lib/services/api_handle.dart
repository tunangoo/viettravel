import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viettravel/helpers/app_constant.dart';
import 'package:viettravel/models/user_model.dart';
import 'package:viettravel/services/response_handle.dart';

Future<ResponseHandle> getPlaceDetail(int placeId) async {
  try {
    final response = await http.get(
      Uri.parse('$baseApiUrl/place/detail/$placeId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
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

Future<ResponseHandle> getUserInfo() async {
  try {
    final response = await http.get(
      Uri.parse('$baseApiUrl/user/info'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
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

Future<ResponseHandle> updateUserInfo(UserModel user) async {
  try {
    final response = await http.patch(
      Uri.parse('$baseApiUrl/user/update_info'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(user.toJson()),
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

Future<ResponseHandle> getFavoritePlaces() async {
  try {
    final response = await http.get(
      Uri.parse('$baseApiUrl/favorite/all'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    // ResponseHandle responseHandle = ResponseHandle.fromHttpResponse(response);
    return ResponseHandle(
        statusCode: response.statusCode,
        body: response.body
    );
  } catch (error) {
    return ResponseHandle(
      statusCode: 500,
      message: 'Có lỗi xảy ra',
    );
  }
}
