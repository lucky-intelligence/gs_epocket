import 'package:flutter/material.dart';
import 'package:playrooms/components/home/exchanges/exchange_card.dart';

class Exchanges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> exchanges = <String>[
      "Cacahuates", "Gomitas", "Aguas", "Confitados"
    ];

    Widget title = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // text        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,          
          children: <Widget>[            
            Text("Intercambios", style: TextStyle(
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
            onPressed: () => Navigator.pushReplacementNamed(context, "exchanges"),
            child: Center(child: Icon(Icons.arrow_forward, size: 15))
          )
        )
      ]
    );

    Widget exchangeScroll = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: exchanges.map((exchange) => Padding(
            padding: EdgeInsets.only(right: 10),
            child: ExchangeCard(productName: exchange)
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
          exchangeScroll,
        ],
      )
    );
  }
}