import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';


class HomeCartButton extends StatelessWidget {

  const HomeCartButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {


    final cart =
        Provider.of<CartProvider>(context);



    return Stack(

      children: [


        IconButton(

          onPressed: (){

            // Navigate to cart screen later

          },


          icon: const Icon(
            Icons.shopping_cart,
            size: 32,
            color: Colors.red,
          ),

        ),



        if(cart.totalItems > 0)

        Positioned(

          right: 4,
          top: 4,

          child: CircleAvatar(

            radius: 10,

            backgroundColor: Colors.red,


            child: Text(

              cart.totalItems.toString(),

              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),

            ),

          ),

        )

      ],

    );

  }
}