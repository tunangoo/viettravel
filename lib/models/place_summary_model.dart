class PlaceSummaryModel {
  int placeId;
  String name;
  String address;
  int price;
  String imageUrl;
  bool favorite;

  PlaceSummaryModel({
    required this.placeId,
    required this.name,
    required this.address,
    required this.price,
    required this.imageUrl,
    required this.favorite,
  });

  factory PlaceSummaryModel.fromJson(Map<String, dynamic> json) {
    return PlaceSummaryModel(
      placeId: json['placeId'] ?? 0,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      price: json['price'] ?? 0,
      imageUrl: json['imageUrl'] ?? '',
      favorite: json['favorite'] ?? false,
    );
  }
}
