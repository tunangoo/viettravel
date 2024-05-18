class UserModel {
  String fullName;
  String? phoneNumber;
  String email;
  String? address;
  String? avatar;
  int? balance;

  UserModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    this.avatar,
    required this.balance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      avatar: json['avatar'],
      balance: json['balance'] ?? 0,
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
