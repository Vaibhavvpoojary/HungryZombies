import 'package:flutter/material.dart';

import '../../../home/data/models/category_model.dart';
import '../../../home/data/models/food_model.dart';
import '../../../home/presentation/widgets/food_card.dart';
import '../../../cart/presentation/screens/cart_screen.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final CategoryModel category;

  const CategoryDetailsScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    // Use foods from the category object (loaded from API)
    final List<FoodModel> categoryFoods = category.foods;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: Text(category.name),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Cover Banner
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.red.shade100,
              child: const Icon(
                Icons.fastfood,
                size: 80,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                category.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                category.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Available Items",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            if (categoryFoods.isEmpty)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "No food items available.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categoryFoods.length,
                itemBuilder: (context, index) {
                  return FoodCard(
                    food: categoryFoods[index],
                  );
                },
              ),

            const SizedBox(height: 100),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 55),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "Continue to Cart",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}