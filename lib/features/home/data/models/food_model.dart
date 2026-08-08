class FoodModel {
  final String id;
  final String categoryId;
  final String name;
  final String description;
  final String image;
  final double price;
  final bool isVeg;
  final bool isPopular;
  final double rating;

  const FoodModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.isVeg,
    required this.isPopular,
    required this.rating,
  });

  factory FoodModel.fromJson(
    Map<String, dynamic> json, {
    String? categoryId,
  }) {
    return FoodModel(
      id: json['id'].toString(),
      categoryId:
          categoryId ?? json['category_id']?.toString() ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: double.tryParse(
            json['price'].toString(),
          ) ??
          0.0,
      isVeg: json['is_veg'] ?? false,

      // Backend doesn't currently have is_popular.
      // We keep the field for your existing UI.
      isPopular: json['is_popular'] ?? false,

      rating: double.tryParse(
            json['rating'].toString(),
          ) ??
          0.0,
    );
  }
}