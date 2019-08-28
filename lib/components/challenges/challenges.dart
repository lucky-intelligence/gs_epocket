import 'package:flutter/material.dart';
import 'package:playrooms/components/challenges/card/challenge_card.dart';
import 'package:playrooms/global_components/buttons/back_button.dart';

class Challenges extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    List<String> exchanges = <String>[
      "Gomi LLuvia", "Vente Pa’K", "Escape Forajido", "Agua CircleK"
    ];

    Widget exchangeScroll = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: exchanges.map((exchange) => Padding(            
          padding: EdgeInsets.only(right: 15),
          child: ChallengeCard(productName: exchange))
        ).toList()
      )
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10), child: Back("home")),
            Column(
              children: <Widget>[                    
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Gomi Lluvia", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("¿Cuantos retos de Gomi Lluvia puedes lograr? !Alcanzalos todos para un premio sorpresa!", style: TextStyle(color: Colors.black, fontSize: 10)),
                    SizedBox(height: 10),
                    exchangeScroll
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Vente Pa’K", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Atrapa a todos los cacahuates para lograr los siguientes retos.", style: TextStyle(color: Colors.black, fontSize: 10)),
                    SizedBox(height: 10),
                    exchangeScroll
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Escape Forajido", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("¿Que tan alto podrás llegar? Descubre los logros desbloqueables por alcanzar estos objetivos.", style: TextStyle(color: Colors.black, fontSize: 10)),
                    SizedBox(height: 10),
                    exchangeScroll
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Agua CircleK", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Son nuevos, deliciosos, ¡y saludables!", style: TextStyle(color: Colors.black, fontSize: 10)),
                    SizedBox(height: 10),
                    exchangeScroll
                  ],
                ),
                SizedBox(height: 20)
              ],
            )
          ],
        )
      ),
    );
  }
}