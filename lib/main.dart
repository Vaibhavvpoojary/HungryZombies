import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'features/cart/providers/cart_provider.dart';


void main() {

  runApp(

    MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),

      ],

      child: const HungryZombiesApp(),

    ),

  );

}