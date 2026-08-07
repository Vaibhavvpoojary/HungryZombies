import 'package:flutter/material.dart';

import '../../home/data/models/food_model.dart';
import '../data/models/cart_item_model.dart';


class CartProvider extends ChangeNotifier {


  final List<CartItemModel> _items = [];


  List<CartItemModel> get items => _items;


  int get totalItems {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }


  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }


  void addToCart(FoodModel food){
    final existingIndex = _items.indexWhere((item) => item.food.id == food.id);
    
    if (existingIndex >= 0) {
      _items[existingIndex] = CartItemModel(
        food: _items[existingIndex].food,
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      _items.add(CartItemModel(
        food: food,
        quantity: 1,
      ));
    }
    
    notifyListeners();
  }


  void increaseQuantity(FoodModel food){
    final existingIndex = _items.indexWhere((item) => item.food.id == food.id);
    
    if (existingIndex >= 0) {
      _items[existingIndex] = CartItemModel(
        food: _items[existingIndex].food,
        quantity: _items[existingIndex].quantity + 1,
      );
      notifyListeners();
    }
  }


  void decreaseQuantity(FoodModel food){
    final existingIndex = _items.indexWhere((item) => item.food.id == food.id);
    
    if (existingIndex >= 0) {
      final currentQuantity = _items[existingIndex].quantity;
      
      if (currentQuantity > 1) {
        _items[existingIndex] = CartItemModel(
          food: _items[existingIndex].food,
          quantity: currentQuantity - 1,
        );
      } else {
        _items.removeAt(existingIndex);
      }
      
      notifyListeners();
    }
  }


  void removeFromCart(FoodModel food){
    _items.removeWhere((item) => item.food.id == food.id);
    notifyListeners();
  }


  void clearCart(){
    _items.clear();
    notifyListeners();
  }


}
