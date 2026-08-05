import '../../features/orders/data/models/order_model.dart';


class OrderDummyData {


  static List<OrderModel> orders = [

    OrderModel(

      id: "1001",

      items: [

        "Chicken Burger",
        "French Fries",

      ],

      totalAmount: 299,

      orderType: "Parcel",

      status: "Delivered",

      date: "Today",

    ),



    OrderModel(

      id: "1002",

      items: [

        "Pizza",
        "Cold Drink",

      ],

      totalAmount: 499,

      orderType: "Dine In",

      status: "Preparing",

      date: "Yesterday",

    ),


  ];

}