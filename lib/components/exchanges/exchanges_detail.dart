import 'package:flutter/material.dart';
import 'package:playrooms/components/exchanges/exchanges_header.dart';
import 'package:playrooms/components/home/header/header.dart';
import 'package:playrooms/global_components/buttons/back_button.dart';
import 'package:playrooms/global_components/custom_dialog/custom_dialog.dart';

class ExchangesDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(        
        children: <Widget>[
          Container(
            color: Color(0xFFFEDC21),
            height: 83,
            child: Padding(child: ExchangesHeader(() => "_scaffoldKey.currentState.openDrawer()"), padding: EdgeInsets.only(left: 20, bottom: 5,top: 5, right: 20)),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                    Navigator.popAndPushNamed(context, "scan");
                  },
                  child: Image.asset("assets/content-2.png", fit: BoxFit.fill),
                )
              ],
            )
          )
        ],
      )
    );
  }  
}