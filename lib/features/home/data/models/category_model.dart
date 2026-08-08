import 'food_model.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final List<FoodModel> foods;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    this.foods = const [],
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final foodsJson = json['foods'] as List<dynamic>? ?? [];

    return CategoryModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      foods: foodsJson
          .map(
            (food) => FoodModel.fromJson(
              food as Map<String, dynamic>,
              categoryId: json['id'].toString(),
            ),
          )
          .toList(),
    );
  }
}