import 'dart:convert';
import 'package:http/http.dart' as http;

class ResponseHandle {
  var statusCode;
  var message;
  dynamic body;

  ResponseHandle({
    this.statusCode,
    this.message,
    this.body,
  });

  factory ResponseHandle.fromHttpResponse(http.Response response) {
    try {
      // dynamic body = json.decode(response.body);
      dynamic body = response.body;
      return ResponseHandle(
        statusCode: response.statusCode,
        body: body,
      );
    } catch (error) {
      return ResponseHandle(
        statusCode: response.statusCode,
        message: response.body,
      );
    }
  }
}