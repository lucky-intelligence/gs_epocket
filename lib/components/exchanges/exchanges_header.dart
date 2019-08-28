import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playrooms/components/database/database.dart';
import 'package:playrooms/components/home/header/header_input.dart';
import 'package:playrooms/components/signin/login_input.dart';
import 'package:playrooms/global_components/buttons/back_button.dart';
import 'package:playrooms/services/services.dart';

class ExchangesHeader extends StatefulWidget{

  var onTap;

  ExchangesHeader(this.onTap);

  @override
  State<StatefulWidget> createState() => new HeaderView(onTap);

}

class HeaderView extends State<ExchangesHeader> {

  dynamic bank = {"koins": -1, "stars": -1};

  var onTap;

  HeaderView(this.onTap);

  @override
  void initState() {  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget koins = Row(
      children: <Widget>[
        Container(          
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Color(0xFFDA291C),
            shape: BoxShape.circle
          ),
          
          child: Center(child: Text("K", style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          )))
        ),

        SizedBox(width: 10),

        Text((this.bank["koins"] ?? 0).toString(), style: TextStyle(fontWeight: FontWeight.bold))
      ]
    );

    Widget stars = Row(
      children: <Widget>[
        Icon(Icons.menu, color: Colors.black12),

        SizedBox(width: 10),

        Text((this.bank["stars"] ?? 0).toString(), style: TextStyle(fontWeight: FontWeight.bold))
      ]
    );
    
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Row(          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Back("home"),
            Expanded(
              child: Center(child: Text("", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24)
              ),
            ),
            SizedBox(width: 10),
            Center(child: Icon(Icons.shopping_cart, color: Color(0xFF000000), size: 30))
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}