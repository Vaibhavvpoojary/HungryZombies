class OfferDealModel {
  final int id;
  final int restaurantId;
  final String title;
  final String description;
  final String type;
  final String discountType;
  final double discountValue;
  final String imageUrl;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isActive;

  const OfferDealModel({
    required this.id,
    required this.restaurantId,
    required this.title,
    required this.description,
    required this.type,
    required this.discountType,
    required this.discountValue,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.isActive,
  });

  factory OfferDealModel.fromJson(Map<String, dynamic> json) {
    return OfferDealModel(
      id: json['id'],
      restaurantId: json['restaurant_id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      discountType: json['discount_type'] ?? 'none',
      discountValue:
          double.tryParse(
            json['discount_value']?.toString() ?? '0',
          ) ??
          0.0,
      imageUrl: json['image_url'] ?? '',
      startDate: json['start_date'] != null
          ? DateTime.tryParse(json['start_date'])
          : null,
      endDate: json['end_date'] != null
          ? DateTime.tryParse(json['end_date'])
          : null,
      isActive: json['is_active'] ?? false,
    );
  }
}