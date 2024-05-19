import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viettravel/helpers/app_constant.dart';
import 'package:viettravel/helpers/number_format.dart';
import 'package:viettravel/models/user_model.dart';
import 'package:viettravel/services/response_handle.dart';

Future<ResponseHandle> getPlaceDetail(int placeId) async {
  print('get place detail');
  print(placeId);
  try {
    final response = await http.get(
      Uri.parse('$baseApiUrl/place/detail/$placeId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print(response.body);
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
  print('get user info');
  try {
    final response = await http.get(
      Uri.parse('$baseApiUrl/user/info'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print(response.body);
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
  print('update user info');
  print(user.toString());
  try {
    final response = await http.patch(
      Uri.parse('$baseApiUrl/user/update_info'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(user.toJson()),
    );
    print(response.body);
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
  print('get favorite places');
  try {
    final response = await http.get(
      Uri.parse('$baseApiUrl/favorite/all'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print(response.body);
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

Future<ResponseHandle> addFavoritePlace(int placeId) async {
  print('add favorite place');
  print(placeId);
  try {
    final response = await http.post(
      Uri.parse('$baseApiUrl/favorite/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(<String, dynamic>{
        'place_id': placeId,
      }),
    );
    print(response.body);
    ResponseHandle responseHandle = ResponseHandle.fromHttpResponse(response);
    return responseHandle;
  } catch (error) {
    return ResponseHandle(
      statusCode: 500,
      message: 'Có lỗi xảy ra',
    );
  }
}

Future<ResponseHandle> deleteFavoritePlace(int placeId) async {
  print('delete favorite place');
  print(placeId);
  try {
    final response = await http.delete(
      Uri.parse('$baseApiUrl/favorite/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(<String, dynamic>{
        'place_id': placeId,
      }),
    );
    print(response.body);
    ResponseHandle responseHandle = ResponseHandle.fromHttpResponse(response);
    return responseHandle;
  } catch (error) {
    return ResponseHandle(
      statusCode: 500,
      message: 'Có lỗi xảy ra',
    );
  }
}

Future<ResponseHandle> getRecommendPlaces() async {
  print('get recommend places');
  try {
    final response = await http.get(
      Uri.parse('$baseApiUrl/place/recommend'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print(response.body);
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

Future<ResponseHandle> getFreePlaces() async {
  print('get free places');
  try {
    final response = await http.get(
      Uri.parse('$baseApiUrl/place/free'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print(response.body);
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

Future<ResponseHandle> getAllPlaces() async {
  print('get all places');
  try {
    final response = await http.get(
      Uri.parse('$baseApiUrl/place/all'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print(response.body);
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

Future<ResponseHandle> createTicket(int placeId, DateTime entryTime, int quantity, int totalAmount) async {
  print('create ticket');
  try {
    final response = await http.post(
      Uri.parse('$baseApiUrl/ticket/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(<String, dynamic>{
        'place_id': placeId,
        'entryTime': convertDateTimeFormat(entryTime),
        'quantity': quantity,
        'totalAmount': totalAmount,
      }),
    );
    print(response.body);
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

Future<ResponseHandle> getAllTickets() async {
  print('get all tickets');
  try {
    final response = await http.get(
      Uri.parse('$baseApiUrl/ticket/all'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print("tickets:");
    print(response.body);
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