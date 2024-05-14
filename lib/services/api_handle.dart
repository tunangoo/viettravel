import 'package:http/http.dart' as http;
import 'package:viettravel/helpers/app_constant.dart';
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
