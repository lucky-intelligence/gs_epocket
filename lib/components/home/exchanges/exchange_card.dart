import 'package:flutter/material.dart';

class ExchangeCard extends StatelessWidget {
  final String productName;

  ExchangeCard({this.productName});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: <Widget>[
          Spacer(flex: 1),
          Spacer(flex: 1),
          Container(
            width: 120,
            height: 60,

            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Center(child: Text(productName, style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            )))
          )
        ]
      )
    );
  }
}