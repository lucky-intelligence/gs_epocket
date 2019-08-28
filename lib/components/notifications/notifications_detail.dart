import 'package:flutter/material.dart';
import 'package:playrooms/components/notifications/card/notification_card.dart';
import 'package:playrooms/global_components/buttons/back_button.dart';

class NotificationDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(        
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10), child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Back("notifications"),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFFf5dadf),
                  border: Border.all(color: Color(0xFFf2a6ab)),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Icon(Icons.delete_forever, size: 20, color: Color(0xFFDA291C))),
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
                  Text("Cacahuates de 200g", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", style: TextStyle(fontSize: 12)),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFDA291C),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    )
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