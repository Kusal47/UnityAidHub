import 'package:flutter/material.dart';


class OrderSummary extends StatefulWidget {
  OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body:Container(
        child: Text('order summary'),
      )
      );
  }
}
