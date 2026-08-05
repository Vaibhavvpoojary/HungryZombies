import '../../../home/data/models/food_model.dart';

class CartItemModel {
  final FoodModel food;
  final int quantity;

  const CartItemModel({
    required this.food,
    required this.quantity,
  });

  double get totalPrice => food.price * quantity;
}