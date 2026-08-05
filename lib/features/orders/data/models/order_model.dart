import '../../../cart/data/models/cart_item_model.dart';

class OrderModel {
  final String id;
  final List<CartItemModel> items;
  final double totalAmount;
  final String orderType;
  final DateTime orderDate;
  final String status;

  const OrderModel({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.orderType,
    required this.orderDate,
    required this.status,
  });
}