class TicketModel {
  int placeId;
  String placeImage;
  String placeName;
  DateTime entryTime;
  int quantity;
  int totalAmount;

  TicketModel({
    required this.placeId,
    required this.placeImage,
    required this.placeName,
    required this.entryTime,
    required this.quantity,
    required this.totalAmount,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      placeId: json['place_id'] ?? 0,
      placeImage: json['place_image'] ?? '',
      placeName: json['place_name'] ?? '',
      entryTime: json['entryTime'] != null
          ? DateTime(json['entryTime'][0] as int, json['entryTime'][1] as int, json['entryTime'][2] as int)
          : DateTime.now(),
      quantity: json['quantity'] ?? 0,
      totalAmount: json['totalAmount'] ?? 0
    );
  }
}