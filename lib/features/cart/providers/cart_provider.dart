import 'package:flutter/material.dart';

import '../../home/data/models/food_model.dart';


class CartProvider extends ChangeNotifier {


  final List<FoodModel> _items = [];


  List<FoodModel> get items => _items;



  int get totalItems {

    return _items.length;

  }



  void addToCart(FoodModel food){

    _items.add(food);

    notifyListeners();

  }



  void removeFromCart(FoodModel food){

    _items.remove(food);

    notifyListeners();

  }


}