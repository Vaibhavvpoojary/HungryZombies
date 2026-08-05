import 'package:flutter/material.dart';


class OrderSuccessScreen extends StatelessWidget {


  const OrderSuccessScreen({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


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