class PlaceSummaryModel {
  int placeId;
  String name;
  String address;
  int price;
  String imageUrl;
  bool favorite;
  double rating;

  PlaceSummaryModel({
    required this.placeId,
    required this.name,
    required this.address,
    required this.price,
    required this.imageUrl,
    required this.favorite,
    required this.rating,
  });

  factory PlaceSummaryModel.fromJson(Map<String, dynamic> json) {
    return PlaceSummaryModel(
      placeId: json['placeId'] ?? 0,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      price: json['price'] ?? 0,
      imageUrl: json['imageUrl'] ?? '',
      favorite: json['favorite'] ?? false,
      rating: json['rating'] ?? 0,
    );
  }
}
