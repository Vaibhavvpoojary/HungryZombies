import 'package:flutter/material.dart';

import '../../../cart/presentation/widgets/home_cart_button.dart';


class HomeHeader extends StatelessWidget {

  const HomeHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [


          Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                "Hungry Zombies",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),


              const SizedBox(height: 5),


              Text(
                "What are you craving today?",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

            ],

          ),



          // Cart Icon
          const HomeCartButton(),

        ],

      ),

    );

  }

}