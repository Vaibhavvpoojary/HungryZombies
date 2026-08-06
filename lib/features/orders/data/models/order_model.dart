class OrderModel {

  final String id;
  final List<String> items;
  final double totalAmount;
  final String orderType;
  final String status;
  final String date;


  const OrderModel({

    required this.id,
    required this.items,
    required this.totalAmount,
    required this.orderType,
    required this.status,
    required this.date,

  });

}