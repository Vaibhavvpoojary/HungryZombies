import '../../features/home/data/models/category_model.dart';
import '../../features/home/data/models/food_model.dart';

class DummyData {
  // ===========================
  // Categories
  // ===========================

  static const List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'Pizza',
      image: 'assets/images/categories/pizza.png',
      description: 'Fresh oven baked pizzas',
    ),
    CategoryModel(
      id: '2',
      name: 'Burgers',
      image: 'assets/images/categories/burger.png',
      description: 'Juicy grilled burgers',
    ),
    CategoryModel(
      id: '3',
      name: 'Indian Meals',
      image: 'assets/images/categories/indian.png',
      description: 'Traditional Indian meals',
    ),
    CategoryModel(
      id: '4',
      name: 'Chinese',
      image: 'assets/images/categories/chinese.png',
      description: 'Authentic Chinese cuisine',
    ),
    CategoryModel(
      id: '5',
      name: 'Desserts',
      image: 'assets/images/categories/desserts.png',
      description: 'Sweet treats',
    ),
    CategoryModel(
      id: '6',
      name: 'Drinks',
      image: 'assets/images/categories/drinks.png',
      description: 'Refreshing beverages',
    ),
    CategoryModel(
      id: '7',
      name: 'Sandwiches',
      image: 'assets/images/categories/sandwiches.png',
      description: 'Fresh sandwiches & wraps',
    ),
    CategoryModel(
      id: '8',
      name: 'Snacks',
      image: 'assets/images/categories/snacks.png',
      description: 'Quick bites',
    ),
  ];

  // ===========================
  // Food Items
  // ===========================

  static const List<FoodModel> foods = [
    FoodModel(
      id: '1',
      categoryId: '1',
      name: 'Margherita Pizza',
      description: 'Classic cheese pizza with mozzarella.',
      image: 'assets/images/foods/margherita.png',
      price: 299,
      isVeg: true,
      isPopular: true,
      rating: 4.8,
    ),

    FoodModel(
      id: '2',
      categoryId: '1',
      name: 'Farmhouse Pizza',
      description: 'Loaded with fresh vegetables.',
      image: 'assets/images/foods/farmhouse.png',
      price: 399,
      isVeg: true,
      isPopular: true,
      rating: 4.7,
    ),

    FoodModel(
      id: '3',
      categoryId: '2',
      name: 'Chicken Burger',
      description: 'Grilled chicken patty with cheese.',
      image: 'assets/images/foods/chicken_burger.png',
      price: 199,
      isVeg: false,
      isPopular: true,
      rating: 4.6,
    ),

    FoodModel(
      id: '4',
      categoryId: '2',
      name: 'Veg Burger',
      description: 'Crispy vegetable patty with mayo.',
      image: 'assets/images/foods/veg_burger.png',
      price: 169,
      isVeg: true,
      isPopular: true,
      rating: 4.5,
    ),

    FoodModel(
      id: '5',
      categoryId: '3',
      name: 'Veg Thali',
      description: 'Complete Indian vegetarian meal.',
      image: 'assets/images/foods/veg_thali.png',
      price: 249,
      isVeg: true,
      isPopular: false,
      rating: 4.4,
    ),

    FoodModel(
      id: '6',
      categoryId: '3',
      name: 'Chicken Biryani',
      description: 'Hyderabadi style chicken biryani.',
      image: 'assets/images/foods/biryani.png',
      price: 289,
      isVeg: false,
      isPopular: true,
      rating: 4.9,
    ),

    FoodModel(
      id: '7',
      categoryId: '4',
      name: 'Hakka Noodles',
      description: 'Veg Hakka noodles.',
      image: 'assets/images/foods/noodles.png',
      price: 189,
      isVeg: true,
      isPopular: true,
      rating: 4.6,
    ),

    FoodModel(
      id: '8',
      categoryId: '4',
      name: 'Schezwan Fried Rice',
      description: 'Spicy fried rice with vegetables.',
      image: 'assets/images/foods/fried_rice.png',
      price: 219,
      isVeg: true,
      isPopular: false,
      rating: 4.5,
    ),

    FoodModel(
      id: '9',
      categoryId: '5',
      name: 'Chocolate Brownie',
      description: 'Warm brownie with chocolate sauce.',
      image: 'assets/images/foods/brownie.png',
      price: 149,
      isVeg: true,
      isPopular: true,
      rating: 4.9,
    ),

    FoodModel(
      id: '10',
      categoryId: '5',
      name: 'Vanilla Ice Cream',
      description: 'Creamy vanilla ice cream.',
      image: 'assets/images/foods/icecream.png',
      price: 99,
      isVeg: true,
      isPopular: false,
      rating: 4.5,
    ),

    FoodModel(
      id: '11',
      categoryId: '6',
      name: 'Cold Coffee',
      description: 'Chilled coffee with ice cream.',
      image: 'assets/images/foods/cold_coffee.png',
      price: 149,
      isVeg: true,
      isPopular: true,
      rating: 4.8,
    ),

    FoodModel(
      id: '12',
      categoryId: '6',
      name: 'Mango Shake',
      description: 'Fresh Alphonso mango shake.',
      image: 'assets/images/foods/mango_shake.png',
      price: 129,
      isVeg: true,
      isPopular: false,
      rating: 4.6,
    ),
  ];

  // ===========================
  // Home Sections
  // ===========================

  static List<FoodModel> get popularFoods =>
      foods.where((food) => food.isPopular).toList();

  static List<FoodModel> get recommendedFoods =>
      foods.where((food) => food.rating >= 4.7).toList();

  static List<FoodModel> get todaysSpecial =>
      foods.take(5).toList();
}