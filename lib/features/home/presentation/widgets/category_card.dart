import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryCard({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const SizedBox(
        height: 120,
        child: Center(
          child: Text(
            'No categories available',
          ),
        ),
      );
    }

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

            return GestureDetector(
            onTap: () {
              context.push(
                '/category-details/${category.id}',
                extra: category,
              );
            },
            child: Container(
              width: 90,
              margin: const EdgeInsets.only(
                right: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor:
                        Colors.red.shade50,
                    child: const Icon(
                      Icons.fastfood,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}