import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../features/orders/providers/order_provider.dart';


class OrdersScreen extends StatelessWidget {


  const OrdersScreen({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    final orderProvider = Provider.of<OrderProvider>(context);
    final orders = orderProvider.orders;



    return Scaffold(


      appBar: AppBar(

        title:
        const Text(
          "Order History",
        ),

        centerTitle:true,

      ),



      body: orders.isEmpty


          ? const Center(

              child: Text(
                "No Orders Yet",
                style: TextStyle(
                  fontSize:18,
                ),
              ),

            )



          : ListView.builder(

              itemCount: orders.length,


              itemBuilder:(context,index){


                final order = orders[index];



                return Card(

                  margin:
                  const EdgeInsets.all(12),


                  elevation:3,


                  shape:
                  RoundedRectangleBorder(

                    borderRadius:
                    BorderRadius.circular(16),

                  ),



                  child: Padding(

                    padding:
                    const EdgeInsets.all(16),


                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,


                      children:[



                        Row(

                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,


                          children: [



                            Text(

                              "Order #${order.id}",


                              style:
                              const TextStyle(

                                fontSize:18,

                                fontWeight:
                                FontWeight.bold,

                              ),

                            ),



                            Text(

                              order.status,


                              style:
                              const TextStyle(

                                color:
                                Colors.green,

                                fontWeight:
                                FontWeight.bold,

                              ),

                            ),



                          ],

                        ),



                        const SizedBox(height:12),



                        Text(

                          order.items.join(", "),

                        ),



                        const SizedBox(height:10),



                        Text(

                          "Order Type: ${order.orderType}",

                        ),



                        const SizedBox(height:5),



                        Text(

                          "Total: ₹${order.totalAmount.toStringAsFixed(0)}",

                          style:
                          const TextStyle(

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),



                        const SizedBox(height:5),



                        Text(

                          order.date,

                          style:
                          const TextStyle(

                            color:
                            Colors.grey,

                          ),

                        ),

                      ],

                    ),

                  ),

                );


              },

            ),


    );

  }

}