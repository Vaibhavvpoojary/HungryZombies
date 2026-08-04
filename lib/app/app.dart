import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class HungryZombiesApp extends StatelessWidget {
  const HungryZombiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hungry Zombies',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      routerConfig: AppRouter.router,
    );
  }
}