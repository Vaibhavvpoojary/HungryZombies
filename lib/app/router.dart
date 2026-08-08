import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/category/presentation/screens/category_details_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/signup_screen.dart';
import '../features/navigation/presentation/screens/main_screen.dart';
import '../features/home/data/models/category_model.dart';

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
          final category = state.extra as CategoryModel?;

          if (category == null) {
            // Fallback: if no extra passed, we need to handle this
            // For now, return an empty category or show error
            return Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: const Center(
                child: Text('Category not found'),
              ),
            );
          }

          return CategoryDetailsScreen(
 
            category: category,
          );

        },
      ),

    ],
  );
}