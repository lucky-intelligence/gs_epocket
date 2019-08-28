import 'package:flutter/material.dart';
import 'package:playrooms/components/home/challenges/challenge_card.dart';

class Challenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> challenges = <String>[
      "Reto 1", "Reto 2", "Reto 3"
    ];

    Widget title = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[            
            Text("Retos", style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            )),
            
            Text("Completa los siguientes retos para obtener estrellas adicionales", style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            )),
          ],
        ),

        // button
        ButtonTheme(
          minWidth: 26,
          height: 26,
          
          buttonColor: Colors.white,
          shape: CircleBorder(),

          child: RaisedButton(
            onPressed: () => Navigator.pushReplacementNamed(context, "challenges"),
            child: Center(child: Icon(Icons.arrow_forward, size: 15))
          )
        )
      ]
    );
    
    Widget challengesScroll = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: challenges.map((exchange) => Padding(
            padding: EdgeInsets.only(right: 10),
            child: ChallengeCard(challengeName: exchange)
            )
          ).toList()
        )
      )
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // title
          Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: title),

          // exchanges
          challengesScroll,
        ],
      )
    );
  }
}