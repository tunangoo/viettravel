import 'package:flutter/foundation.dart';
import 'package:viettravel/models/user_model.dart';

import '../services/api_handle.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
    fullName: '',
    phoneNumber: '',
    email: '',
    address: '',
    avatar: null,
    balance: 0,
  );

  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void updateUserInfo(String fullName, String phoneNumber, String email, String address) {
    _user.updateUserInfo(fullName, phoneNumber, email, address);
    notifyListeners();
  }

  Future<void> fetchUserInfo() async {
    try {
      final response = await getUserInfo();
      if (response.statusCode == 200) {
        _user = UserModel.fromJson(response.body);
      } else {
        // Handle error response
        // You might want to throw an exception here or log the error
      }
    } catch (error) {
      // Handle error
      // You might want to throw an exception here or log the error
    }
    notifyListeners();
  }
}
