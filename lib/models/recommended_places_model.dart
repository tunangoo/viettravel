class RecommendedPlaceModel {
  final int placeId;
  final String name;
  final String address;
  final int price;
  final String imageUrl;
  final bool favorite;
  final double rating;
  RecommendedPlaceModel({
    required this.placeId,
    required this.name,
    required this.address,
    required this.price,
    required this.imageUrl,
    required this.favorite,
    required this.rating,
});
}

List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
      placeId: 1,
      name: "Tên địa điểm",
      address: "",
      price: 45,
      imageUrl: "assets/images/place1.jpg",
      favorite: true,
      rating: 999,
  ),
  RecommendedPlaceModel(
    placeId: 1,
    name: "Tên địa điểm",
    address: "",
    price: 45,
    imageUrl: "assets/images/place1.jpg",
    favorite: true,
    rating: 999,
  ),
  RecommendedPlaceModel(
    placeId: 1,
    name: "Tên địa điểm",
    address: "",
    price: 45,
    imageUrl: "assets/images/place1.jpg",
    favorite: true,
    rating: 999,
  ),
  RecommendedPlaceModel(
    placeId: 1,
    name: "Tên địa điểm",
    address: "",
    price: 45,
    imageUrl: "assets/images/place1.jpg",
    favorite: true,
    rating: 999,
  ),
  RecommendedPlaceModel(
    placeId: 1,
    name: "Tên địa điểm",
    address: "",
    price: 45,
    imageUrl: "assets/images/place1.jpg",
    favorite: true,
    rating: 999,
  ),
];