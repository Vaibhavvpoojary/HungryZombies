import 'package:flutter/material.dart';
import '../widgets/banner_slider.dart';
import '../widgets/home_header.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_card.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(),

              SearchBarWidget(),

              BannerSlider(),

              SectionTitle(title: "Categories"),

             CategoryCard(),
            ],
          ),
        ),
      ),
    );
  }
}