import 'package:flutter/material.dart';
import 'package:playrooms/global_components/buttons/back_button.dart';

import 'card/exchange_card.dart';

class Exchanges extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    List<String> exchanges = <String>[
      "Cacahuates", "Gomitas", "Aguas", "Confitados"
    ];

    Widget exchangeScroll = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: exchanges.map((exchange) => Padding(            
          padding: EdgeInsets.only(right: 15),
          child: ExchangeCard(productName: exchange))
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
                    Text("Gomas CircleK", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Échale gomitas a tu helado, dorilocos, gomichelas o lo que se te antoje. ¿Cuáles vas a probar hoy?", style: TextStyle(color: Colors.black, fontSize: 10)),
                    SizedBox(height: 10),
                    exchangeScroll
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Cacahuates CircleK", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Están sabrosos y vienen con todo. ¡A estos amigos no los puedes separar!", style: TextStyle(color: Colors.black, fontSize: 10)),
                    SizedBox(height: 10),
                    exchangeScroll
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Confitados CircleK", style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Son nuevos, deliciosos, ¡y saludables!", style: TextStyle(color: Colors.black, fontSize: 10)),
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