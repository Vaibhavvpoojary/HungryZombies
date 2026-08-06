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


                      final food =
                      cart.items[index];



                      return Card(

                        margin:
                        const EdgeInsets.all(12),


                        child: ListTile(


                          leading:
                          const Icon(
                            Icons.fastfood,
                          ),


                          title:
                          Text(
                            food.name,
                          ),


                          subtitle:
                          Text(
                            "₹${food.price}",
                          ),


                          trailing:
                          IconButton(

                            icon:
                            const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),


                            onPressed: (){

                              cart.removeFromCart(food);

                            },

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
                "Home",
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
                        const OrderSuccessScreen(),

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