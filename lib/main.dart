import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'features/cart/providers/cart_provider.dart';
import 'features/orders/providers/order_provider.dart';
import 'features/auth/providers/user_provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => OrderProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: const HungryZombiesApp(),
    ),
  );
}
