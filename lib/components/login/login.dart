import 'package:flutter/material.dart';
import 'package:playrooms/components/database/database.dart';
import 'package:playrooms/components/database/models/user.dart';
import 'package:playrooms/components/login/background/background.dart';
import 'package:playrooms/components/login/login_button/login_button.dart';
import 'package:playrooms/components/login/signup_button/signup_button.dart';
import 'package:playrooms/components/signin/login_input.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LoginView();  
}  

class LoginView extends State<Login> {

  @override
  void initState() {
     LocalData.db.queryUser().then((response) {      
      if (response.length > 0) {
        LocalData.user = User.fromJson(response[0]);
        Navigator.pushNamed(context, "home");
      }
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: screenSize.width, height: screenSize.height,
            child: CustomPaint(painter: Background())
          ),

          Positioned(
            bottom: 160,
            width: screenSize.width,
            
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[                
                Center(
                  child: Text("Elektra\nPocket", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 36, fontFamily: "Gotham Black")),
                ),
                SizedBox(height: 110),
                Center(
                  child: Text("Todo Elektra en tu bolsillo.\nCompra productos.\nVisualizalos en tu casa.\nTodo desde tu celular.", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15, fontFamily: "Gotham Black")),
                ),
                SizedBox(height: 120),
                LoginInput(placeholder: "Correo electronico", textAlign: TextAlign.center),
                LoginInput(placeholder: "Correo electronico", textAlign: TextAlign.center)
              ]
            )
          ),          
          Positioned(
            bottom: 0,
            width: screenSize.width,
            
            child: Column(
              children: <Widget>[                
                SizedBox(height: 20),
                LoginButton()
              ]
            )
          ),
        ]
      )
    );
  }
}