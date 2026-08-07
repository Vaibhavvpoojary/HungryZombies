import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../features/cart/providers/cart_provider.dart';
import '../../../../features/orders/providers/order_provider.dart';
import '../../data/models/order_model.dart';


class OrderSuccessScreen extends StatelessWidget {
  final String orderType;

  const OrderSuccessScreen({
    super.key,
    required this.orderType,
  });



  @override
  Widget build(BuildContext context) {


    // Get cart and order provider
    final cart = Provider.of<CartProvider>(context, listen: false);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    
    // Use the order type passed from cart screen
    // orderType is already available from the constructor
    
    // Create order from cart
    final orderItems = cart.items.map((cartItem) {
      return "${cartItem.food.name} x${cartItem.quantity}";
    }).toList();
    
    final order = OrderModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: orderItems,
      totalAmount: cart.totalPrice,
      orderType: orderType,
      status: "Pending",
      date: "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
    );
    
    // Add order to provider
    orderProvider.addOrder(order);
    
    // Clear cart
    cart.clearCart();



    return Scaffold(

      backgroundColor: Colors.green,


      body: Center(

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,


          children: [


            Container(

              height:100,

              width:100,


              decoration: const BoxDecoration(

                color: Colors.white,

                shape: BoxShape.circle,

              ),


              child: const Icon(

                Icons.check,

                color: Colors.green,

                size:70,

              ),

            ),



            const SizedBox(height:30),



            const Text(

              "Order Placed Successfully!",


              style: TextStyle(

                color: Colors.white,

                fontSize:26,

                fontWeight:
                FontWeight.bold,

              ),

            ),



            const SizedBox(height:40),



            ElevatedButton(

              onPressed: (){


                Navigator.popUntil(
                  context,
                  (route)=>route.isFirst,
                );


              },


              style:
              ElevatedButton.styleFrom(

                backgroundColor:
                Colors.white,

                foregroundColor:
                Colors.green,

              ),


              child: const Text(
                "Back Home",
              ),

            ),

          ],

        ),

      ),


    );

  }

}