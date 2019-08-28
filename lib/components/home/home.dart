import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playrooms/components/home/challenges/challenges.dart';
import 'package:playrooms/components/home/exchanges/exchanges.dart';
import 'package:playrooms/components/home/header/header.dart';
import 'package:playrooms/components/home/play_button/play_button.dart';
import 'package:playrooms/components/home/scan_button/scan_button.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new HomeView();

}

class HomeView extends State<Home>{  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();  

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
              child: Container(
                width: 280,
                height: 310,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Container(
                        width: 164,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Color(0xFFDA291C),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(                        
                        children: <Widget>[
                          Container(
                            width: 84,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFDA291C),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, "notifications"),
                            child: Container(
                              width: 84,
                              height: 80,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Container(
                                width: 84,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xFF212121),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(child: Icon(Icons.notifications, size: 35, color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                    SizedBox(height: 10),
                    Container(
                      width: 280,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center( child: Text("awa", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Mi perfil', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              onTap: () => Navigator.pushNamed(context, "information"),
            ),
            ListTile(
              title: Text('Configuración', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              onTap: () {},
            ),
            ListTile(
              title: Text('Terminos y condiciones', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              onTap: () {},
            ),
            ListTile(
              title: Text('Ayuda', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              onTap: () {},
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15), 
              child: ButtonTheme(
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                buttonColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                  child: Text("CERRAR SESIÓN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[          
          Container(
            color: Color(0xFFFEDC21),
            height: 140,
            child: Padding(child: Header(() => _scaffoldKey.currentState.openDrawer()), padding: EdgeInsets.only(left: 20, bottom: 20,top: 20, right: 20)),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                    Navigator.popAndPushNamed(context, "exchanges_detail");
                  },
                  child: Image.asset("assets/content.png", fit: BoxFit.fill),
                )
              ],
            )
          )
        ],
      )
    );
  }
}