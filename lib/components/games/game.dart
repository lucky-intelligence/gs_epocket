import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playrooms/global_components/buttons/back_button.dart';

class Game extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){ return GameState(); }

}

class GameState extends State<Game> with SingleTickerProviderStateMixin {
  
  TabController tabController;

  @override
  void initState() {    
    super.initState();
    this.tabController = TabController(vsync: this, length: 3, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context){    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(        
          children: <Widget>[
            Back("home"),
            Text("¡Vamos a jugar!", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28)),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25), 
              child: Text("¡Momento de divertirse y recibir algo a cambio!\nJuega usando tus Koins y desbloquea premios. También puedes jugar sin usar tus Koins pero no obtendras\nninguna recompensa.", textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7), fontSize: 12))
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                ),
                child: Column(                      
                  children: <Widget>[
                    Text("{Game Name}",style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          TabBar(
                            isScrollable: true,
                            controller: tabController,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide.none,
                              insets: EdgeInsets.zero
                            ),
                            labelColor: Colors.red,
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                            unselectedLabelColor: Colors.white10,
                            unselectedLabelStyle: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                            ),
                            tabs: <Widget>[
                              Container(
                                width: 220,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xFFDA291C),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Tab(child: SizedBox()),
                              ),
                              Container(
                                width: 220,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Tab(child: SizedBox()),
                              ),
                              Container(
                                width: 220,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Tab(child: SizedBox()),
                              ),
                            ]
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: TabBarView(
                              children: <Widget>[
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: TextStyle(fontSize: 12)),
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: TextStyle(fontSize: 12)),
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: TextStyle(fontSize: 12)),
                              ]
                            )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),                    
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[                      
                        ButtonTheme(
                          minWidth: 0,
                          buttonColor: Color(0xFFDA291C),
                          padding: EdgeInsets.all(15),
                          child: RaisedButton(
                            onPressed: () {Navigator.popAndPushNamed(context, "game_view_of", arguments: {'game': ['SkyJump', 'FoodDrop', 'SkyJump'][tabController.index], 'cookies': ''});},
                            child: Text("Jugar\nGratis", style: TextStyle(fontSize: 15, color: Colors.white)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(width: 10),
                        ButtonTheme(
                          minWidth: 240,
                          buttonColor: Color.fromRGBO(21, 21, 21, 1),
                          padding: EdgeInsets.all(15),
                          child: RaisedButton(
                            onPressed: () {Navigator.popAndPushNamed(context, "game_view");},
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  child: Text("K", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                  decoration: new BoxDecoration(
                                    color: Color(0xFFDA291C),
                                    border: Border.all(
                                      width: 1
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100)
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text("xN", style: TextStyle(fontSize: 22, color: Colors.white)),
                                SizedBox(width: 20),
                                Text("!Juega y\n Gana!", style: TextStyle(fontSize: 15, color: Colors.white)),
                              ],
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}