import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.8,
      buttonColor: Colors.white,
      
      child: RaisedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "home");
        },
        child: Text("Iniciar sesión", 
          style: TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold)),

        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        ),
      )
    );
  }
}