import 'package:flutter/material.dart';
import 'package:playrooms/components/notifications/card/notification_card.dart';
import 'package:playrooms/global_components/buttons/back_button.dart';

class Notifications extends StatelessWidget{
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 10, top: 10, bottom: 10), child: Row(
            children: <Widget>[
              Back("home"),
              Text("Notifications", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
            ],
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NotificationCard(title: "{NOTIFICATION_TITLE}", desc: "{NOTIFICATION_DESCRIPTION}"),
              SizedBox(height: 3),
              NotificationCard(title: "{NOTIFICATION_TITLE}", desc: "{NOTIFICATION_DESCRIPTION}"),              
            ],
          )
        ],
      )
    );
  }  
}