import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = [
      {
        "title": "🍕 Pizza Fiesta",
        "subtitle": "Flat 20% OFF on all pizzas",
      },
      {
        "title": "🍔 Burger Combo",
        "subtitle": "Buy 1 Get 1 Free",
      },
      {
        "title": "🍜 Chinese Special",
        "subtitle": "Unlimited Noodles Festival",
      },
    ];

    return CarouselSlider.builder(
      itemCount: banners.length,
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      itemBuilder: (context, index, realIndex) {
        final banner = banners[index];

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color(0xffD32F2F),
                Color(0xffF44336),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                banner["title"]!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                banner["subtitle"]!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}