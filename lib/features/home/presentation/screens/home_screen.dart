import 'package:flutter/material.dart';

import '../../data/models/category_model.dart';
import '../../data/models/food_model.dart';
import '../../data/services/menu_service.dart';

import '../widgets/banner_slider.dart';
import '../widgets/home_header.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_card.dart';
import '../widgets/section_title.dart';
import '../widgets/food_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MenuService _menuService = MenuService();

  List<CategoryModel> categories = [];
  List<FoodModel> popularFoods = [];

  bool isLoading = true;
  String? errorMessage;

  // Temporary restaurant ID.
  // Later this will come from the selected restaurant.
  static const int restaurantId = 1;

  @override
  void initState() {
    super.initState();
    _loadRestaurantMenu();
  }

  Future<void> _loadRestaurantMenu() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      final data =
          await _menuService.getRestaurantMenu(
        restaurantId,
      );

      final categoryJson =
          data['categories'] as List<dynamic>? ?? [];

      final loadedCategories = categoryJson
          .map(
            (category) => CategoryModel.fromJson(
              category as Map<String, dynamic>,
            ),
          )
          .toList();

      final allFoods = <FoodModel>[];

      for (final category in loadedCategories) {
        allFoods.addAll(category.foods);
      }

      setState(() {
        categories = loadedCategories;
        popularFoods = allFoods;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        errorMessage = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : errorMessage != null
                ? Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize:
                            MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 50,
                            color: Colors.red,
                          ),

                          const SizedBox(height: 16),

                          const Text(
                            'Unable to load menu',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            errorMessage!,
                            textAlign:
                                TextAlign.center,
                          ),

                          const SizedBox(height: 20),

                          ElevatedButton(
                            onPressed:
                                _loadRestaurantMenu,
                            child:
                                const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh:
                        _loadRestaurantMenu,
                    child: SingleChildScrollView(
                      physics:
                          const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          HomeHeader(),

                          SearchBarWidget(),

                          BannerSlider(),

                          const SectionTitle(
                            title: "Categories",
                          ),

                          CategoryCard(
                            categories:
                                categories,
                          ),

                          const SectionTitle(
                            title: "Popular Foods",
                          ),

                          ListView.builder(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(),
                            itemCount:
                                popularFoods.length,
                            itemBuilder:
                                (context, index) {
                              return FoodCard(
                                food:
                                    popularFoods[index],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}