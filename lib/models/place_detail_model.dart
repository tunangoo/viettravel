class PlaceDetailModel {
  int placeId;
  String name;
  String address;
  int price;
  String description;
  List<String> images;

  PlaceDetailModel({
    required this.placeId,
    required this.name,
    required this.address,
    required this.price,
    required this.description,
    required this.images,
  });

  factory PlaceDetailModel.fromJson(Map<String, dynamic> json) {
    return PlaceDetailModel(
      placeId: json['placeId'] ?? 0,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      images: json['images'] != null ? List<String>.from(json['images']) : [],
    );
  }
}
