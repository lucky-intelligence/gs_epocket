import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.8,
      buttonColor: Colors.white,
      
      child: RaisedButton(
        onPressed: () => Navigator.pushReplacementNamed(context, "register"),
        child: Text("¡Crea una cuenta ahora!", 
          style: TextStyle(fontWeight: FontWeight.bold)),

        padding: EdgeInsets.symmetric(vertical: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26)
        ),
      )
    );
  }
}