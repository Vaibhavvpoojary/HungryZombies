import 'package:go_router/go_router.dart';

import '../features/category/presentation/screens/category_details_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/signup_screen.dart';
import '../features/navigation/presentation/screens/main_screen.dart';
import '../features/home/data/models/category_model.dart';
import '../core/data/dummy_data.dart';

class AppRouter {

  AppRouter._();


  static final GoRouter router = GoRouter(

    initialLocation: '/',

    routes: [

      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),


      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),


      GoRoute(
        path: '/signup',
        builder: (context, state) {
          return const SignupScreen();
        },
      ),


      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const MainScreen();
        },
      ),


      GoRoute(
        path: '/category-details/:categoryId',
        builder: (context, state) {
          final categoryId = state.pathParameters['categoryId'];
          final category = categoryId == null
              ? state.extra as CategoryModel
              : DummyData.categories.firstWhere(
                  (item) => item.id == categoryId,
                );

          return CategoryDetailsScreen(
            category: category,
          );

        },
      ),

    ],
  );
}