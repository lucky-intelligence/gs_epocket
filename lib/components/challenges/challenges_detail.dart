import 'package:flutter/material.dart';
import 'package:playrooms/components/home/challenges/challenge_card.dart';
import 'package:playrooms/global_components/buttons/back_button.dart';

class ChallengesDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(        
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10), child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Back("challenges"),
              Container(
                width: 55,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFe0e0e0)),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite_border, size: 20, color: Color(0xFF848484)),
                    Text("294", style: TextStyle(color: Color(0xFF848484), fontSize: 12))
                  ],
                ),
              )
            ],
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text("Gomi Lluvia", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  ChallengeCard(challengeName: "awa"),
                  SizedBox(height: 20),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", style: TextStyle(fontSize: 12)),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 0,
                          buttonColor: Color(0xFFDA291C),
                          padding: EdgeInsets.all(15),
                          child: RaisedButton(                            
                            onPressed: () {},
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
                            onPressed: () {},
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
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }  
}