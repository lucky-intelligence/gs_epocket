import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 160,
      height: 80,
      child: ButtonTheme(
        buttonColor: Color(0xFFDA291C),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(100),
            topRight: Radius.circular(100),
          )
        ),
        
        child: RaisedButton(
          onPressed: () => Navigator.pushNamed(context, "scan"),

          padding: EdgeInsets.symmetric(vertical: 20),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[                            
              Text("Escanea\ntus ticket", style: TextStyle(color: Colors.white)),
              SizedBox(width: 5),
              Icon(Icons.add_a_photo, color: Colors.white, size: 30),
            ]
          )
        )
      )
    );
  }
}