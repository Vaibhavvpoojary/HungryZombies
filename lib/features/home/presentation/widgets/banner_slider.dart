import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../services/api_service.dart';
import '../../data/models/offer_deal_model.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  List<OfferDealModel> offers = [];
  bool isLoading = true;
  String? errorMessage;

  // Currently selected restaurant.
  // Later this can come dynamically from the selected restaurant.
  static const int restaurantId = 1;

  @override
  void initState() {
    super.initState();
    loadOffers();
  }

  Future<void> loadOffers() async {
    try {
      final response =
          await ApiService.getRestaurantOfferDeals(restaurantId);

      final List<dynamic> data =
          response['offer_deals'] ?? [];

      final loadedOffers = data
          .map(
            (json) => OfferDealModel.fromJson(
              json as Map<String, dynamic>,
            ),
          )
          .where((offer) => offer.isActive)
          .toList();

      if (!mounted) return;

      setState(() {
        offers = loadedOffers;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Offer API error: $e');

      if (!mounted) return;

      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Loading state
    if (isLoading) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Error state
    if (errorMessage != null) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: Text(
            'Unable to load offers',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    // No offers available
    if (offers.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: Text(
            'No offers available',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    // API offers
    return CarouselSlider.builder(
      itemCount: offers.length,
      options: CarouselOptions(
        height: 180,
        autoPlay: offers.length > 1,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        autoPlayInterval: const Duration(
          seconds: 3,
        ),
      ),
      itemBuilder: (
        context,
        index,
        realIndex,
      ) {
        final offer = offers[index];

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
          ),
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
            crossAxisAlignment:
                CrossAxisAlignment.start,
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Text(
                offer.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                offer.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 8),

              if (offer.discountValue > 0)
                Text(
                  '${offer.discountValue.toStringAsFixed(0)}% OFF',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}