class UserModel {
  String fullName;
  String? phoneNumber;
  String email;
  String? address;
  String? avatar;

  UserModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      avatar: json['avatar'], // avatar có thể null nên không cần kiểm tra
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
    };
  }
}
