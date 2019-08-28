import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Back extends StatelessWidget{

  String backRoute;
  Back(this.backRoute);

  @override
  Widget build(BuildContext context) {    
    return Row(
      children: <Widget>[
        ButtonTheme(
          minWidth: 30,
          height: 30,                  
          buttonColor: Color(0xFFDA291C),
          shape: CircleBorder(),

          child: RaisedButton(
            onPressed: () => Navigator.pushNamed(context, this.backRoute),
            child: Center(child: Icon(Icons.arrow_back, size: 15, color: Colors.white,))
          )
        )
      ],
    );
  }  
}