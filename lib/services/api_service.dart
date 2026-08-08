import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:3000/api';

  static Future<Map<String, dynamic>> getRestaurantMenu(
    int restaurantId,
  ) async {
    final uri = Uri.parse(
      '$baseUrl/restaurants/$restaurantId/menu',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    throw Exception(
      'Failed to load restaurant menu. '
      'Status code: ${response.statusCode}',
    );
  }


  // =====================================================
  // GET RESTAURANT OFFERS / DEALS
  // =====================================================

  static Future<Map<String, dynamic>> getRestaurantOfferDeals(
    int restaurantId,
  ) async {
    final uri = Uri.parse(
      '$baseUrl/offer-deals/restaurant/$restaurantId',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    throw Exception(
      'Failed to load restaurant offers/deals. '
      'Status code: ${response.statusCode}',
    );
  }
}