import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../../orders/presentation/screens/order_success_screen.dart';


class CartScreen extends StatefulWidget {

  const CartScreen({
    super.key,
  });


  @override
  State<CartScreen> createState() => _CartScreenState();

}



class _CartScreenState extends State<CartScreen> {


  String orderType = "Parcel";



  @override
  Widget build(BuildContext context) {


    final cart = Provider.of<CartProvider>(context);



    return Scaffold(


      appBar: AppBar(

        title: const Text(
          "My Cart",
        ),

        centerTitle: true,

      ),



      body: Column(

        children: [



          Expanded(

            child: cart.items.isEmpty


                ? const Center(

                    child: Text(
                      "Your cart is empty",
                      style: TextStyle(
                        fontSize:18,
                      ),
                    ),

                  )


                : ListView.builder(


                    itemCount: cart.items.length,


                    itemBuilder: (context,index){


                      final cartItem =
                      cart.items[index];

                      final food = cartItem.food;
                      final quantity = cartItem.quantity;
                      final subtotal = cartItem.totalPrice;



                      return Card(

                        margin:
                        const EdgeInsets.all(12),


                        child: Padding(

                          padding: const EdgeInsets.all(12),

                          child: Row(

                            children: [

                              // Food Icon
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.red.withOpacity(0.1),
                                child: const Icon(
                                  Icons.fastfood,
                                  color: Colors.red,
                                ),
                              ),

                              const SizedBox(width: 12),

                              // Food Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    // Food Name
                                    Text(
                                      food.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    // Price
                                    Text(
                                      "₹${food.price.toStringAsFixed(0)}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    // Quantity Controls
                                    Row(
                                      children: [

                                        // Decrease Button
                                        IconButton(
                                          onPressed: () {
                                            cart.decreaseQuantity(food);
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                            color: Colors.red,
                                          ),
                                          iconSize: 28,
                                        ),

                                        // Quantity
                                        Text(
                                          quantity.toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        // Increase Button
                                        IconButton(
                                          onPressed: () {
                                            cart.increaseQuantity(food);
                                          },
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: Colors.red,
                                          ),
                                          iconSize: 28,
                                        ),

                                        const Spacer(),

                                        // Subtotal
                                        Text(
                                          "₹${subtotal.toStringAsFixed(0)}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),

                                        const SizedBox(width: 8),

                                        // Delete Button
                                        IconButton(
                                          onPressed: () {
                                            cart.removeFromCart(food);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),

                        ),

                      );


                    },

                  ),

          ),



          // Order Type Selection

          const Padding(

            padding:
            EdgeInsets.symmetric(
              horizontal:16,
            ),

            child: Align(

              alignment:
              Alignment.centerLeft,


              child: Text(

                "Choose Order Type",

                style: TextStyle(

                  fontSize:18,

                  fontWeight:
                  FontWeight.bold,

                ),

              ),

            ),

          ),



          const SizedBox(height:10),



          Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Row(
    children: [

      // Dine In
      Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              orderType = "Dine In";
            });
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: orderType == "Dine In"
                  ? Colors.red
                  : Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Text(
                "Dine In",
                style: TextStyle(
                  color: orderType == "Dine In"
                      ? Colors.white
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),

      const SizedBox(width: 10),

      // Parcel
      Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              orderType = "Parcel";
            });
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: orderType == "Parcel"
                  ? Colors.red
                  : Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Text(
                "Parcel",
                style: TextStyle(
                  color: orderType == "Parcel"
                      ? Colors.white
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),

      const SizedBox(width: 10),

      // Deliver Home
      Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              orderType = "Deliver Home";
            });
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: orderType == "Deliver Home"
                  ? Colors.red
                  : Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Text(
                "Deliver Home",
                style: TextStyle(
                  color: orderType == "Deliver Home"
                      ? Colors.white
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),

    ],
  ),
),



          const SizedBox(height:20),



          // Total Price Display
          if (cart.items.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "₹${cart.totalPrice.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),



          // Place Order Button

          Padding(

            padding:
            const EdgeInsets.all(16),


            child: ElevatedButton(


              onPressed: cart.items.isEmpty

                  ? null

                  : (){


                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                        OrderSuccessScreen(
                          orderType: orderType,
                        ),

                      ),

                    );


                  },



              style:
              ElevatedButton.styleFrom(

                minimumSize:
                const Size(
                  double.infinity,
                  55,
                ),


                backgroundColor:
                Colors.red,


                foregroundColor:
                Colors.white,


              ),



              child:
              const Text(

                "Place Order",

                style:
                TextStyle(

                  fontSize:18,

                  fontWeight:
                  FontWeight.bold,

                ),

              ),


            ),

          ),



        ],

      ),


    );

  }

}