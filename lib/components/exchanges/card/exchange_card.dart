import 'package:flutter/material.dart';

class ExchangeCard extends StatelessWidget {
  final String productName;

  ExchangeCard({this.productName});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "exchanges_detail"),
      child: Container(
        width: 120,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}