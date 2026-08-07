import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../features/cart/providers/cart_provider.dart';
import '../../../../features/cart/data/models/cart_item_model.dart';
import '../../../../features/home/data/models/food_model.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;

  const FoodCard({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    
    // Find the cart item for this food
    final cartItem = cart.items.firstWhere(
      (item) => item.food.id == food.id,
      orElse: () => CartItemModel(food: food, quantity: 0),
    );
    
    final quantity = cartItem.quantity;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Food Image
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: Icon(
                Icons.fastfood,
                size: 35,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Name
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  /// Description
                  Text(
                    food.description,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Veg / Non-Veg
                  Row(
                    children: [

                      Icon(
                        Icons.circle,
                        size: 12,
                        color: food.isVeg
                            ? Colors.green
                            : Colors.red,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        food.isVeg ? "Veg" : "Non-Veg",
                      ),

                      const Spacer(),

                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),

                      Text(food.rating.toString()),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// Price + Quantity
                  Row(
                    children: [

                      Text(
                        "₹${food.price.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),

                      const Spacer(),

                      IconButton(
                        onPressed: quantity > 0
                            ? () {
                                cart.decreaseQuantity(food);
                              }
                            : null,
                        icon: const Icon(Icons.remove_circle_outline),
                      ),

                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          cart.addToCart(food);
                        },
                        icon: const Icon(Icons.add_circle),
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}