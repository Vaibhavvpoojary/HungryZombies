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
}