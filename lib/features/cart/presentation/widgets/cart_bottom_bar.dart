import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';


class CartBottomBar extends StatelessWidget {

  final int itemCount;

  const CartBottomBar({
    super.key,
    required this.itemCount,
  });


  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(

        color: AppColors.primary,

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),

      ),


      child: Row(

        children: [


          // Cart Icon + Count

          Expanded(
            child: Row(

              children: [

                const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30,
                ),


                const SizedBox(width: 12),


                Text(
                  "$itemCount Items",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),



          // View Cart Button

          Container(

            height: 45,

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius:
              BorderRadius.circular(12),

            ),


            child: TextButton(

              onPressed: (){

                // Navigate to Cart Screen later

              },


              child: const Text(

                "View Cart Items",

                style: TextStyle(

                  color: Colors.red,

                  fontSize: 15,

                  fontWeight: FontWeight.bold,

                ),

              ),

            ),

          ),

        ],

      ),

    );

  }
}