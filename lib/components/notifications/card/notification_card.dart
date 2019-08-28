import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget{

  String title = "";
  String desc = "";
  NotificationCard({this.title, this.desc});

  @override
  Widget build(BuildContext context) {    
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "notifications_detail"),
      child: Container(
        color: Color(0x49ecedf4),
        padding: EdgeInsets.symmetric(vertical: 2),
        child: Container(
          width: double.infinity,
          height: 90,
          padding: EdgeInsets.only(left: 15, right: 5),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,                    
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(this.desc, style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Center(child: Icon(Icons.more_vert, size: 45, color: new Color(0x59000000)))
            ],
          ),
        ),
      ),
    );
  }
}