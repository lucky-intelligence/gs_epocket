import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 160,
      height: 80,
      child: ButtonTheme(
        buttonColor: Color(0xFF000000),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(0),
            topRight: Radius.circular(0),
          )
        ),
        
        child: RaisedButton(
          onPressed: () => Navigator.pushReplacementNamed(context, "game"),

          padding: EdgeInsets.symmetric(vertical: 20),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.gamepad, color: Colors.white, size: 30),
              SizedBox(width: 7),         
              Text("!Juega y Gana!", style: TextStyle(color: Colors.white))
            ]
          )
        )
      )
    );
  }
}