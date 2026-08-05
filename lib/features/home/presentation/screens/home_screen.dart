import 'package:flutter/material.dart';

import '../widgets/home_header.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(),

              SearchBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}