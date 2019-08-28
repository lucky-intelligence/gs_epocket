import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  final String productName;

  ChallengeCard({this.productName});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "challenges_detail"),
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