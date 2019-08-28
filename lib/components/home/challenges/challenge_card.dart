import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  final String challengeName;

  ChallengeCard({this.challengeName});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,

            child: Container(
              width: 140,
              height: 140,

              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),

              // TODO: add "stars" text and icon
              child: Center(child: Text(challengeName, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              )))
            )
          )
        ]
      )
    );
  }
}