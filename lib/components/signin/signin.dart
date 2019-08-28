import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playrooms/components/database/database.dart';
import 'package:playrooms/components/database/models/user.dart';
import 'package:playrooms/components/signin/login_input.dart';
import 'package:playrooms/global_components/custom_dialog/custom_dialog.dart';
import 'package:playrooms/global_components/custom_dialog/dialog_input.dart';
import 'package:playrooms/services/services.dart';
import 'package:validators/validators.dart';

class Signin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SigninView();
  
}

class SigninView extends State<Signin>{

  TextEditingController user = new TextEditingController();
  TextEditingController passwd = new TextEditingController();
  TextEditingController acode = new TextEditingController();
  TextEditingController auser = new TextEditingController();

  bool keepLogged = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ButtonTheme(
              buttonColor: Colors.white,
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, "/"),
                child: Text("Regresar a Inicio", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2E2E2E))),

                padding: EdgeInsets.symmetric(vertical: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
                ),
              )
            )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5),
                  Expanded(
                    child: Form(
                      key: this._formKey,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          SizedBox(height: 110),
                          LoginInput(controller: this.user, placeholder: "Correo o Celular", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";
                            return null;
                          }),
                          LoginInput(passwordEnabled: true, controller: this.passwd, placeholder: "Contraseña", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";
                            return null;
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Checkbox(
                                value: this.keepLogged,
                                onChanged: (state) => setState((){
                                  this.keepLogged = !this.keepLogged;
                                }),
                                activeColor: Color(0xFF232323),
                              ),
                              Text("Mantener sesioń iniciada", style: TextStyle(color: Color(0xFF4F4F4F)))
                            ],
                          ),
                          SizedBox(height: 20),
                          Text("¿No recuerdas tu contraseña?", textAlign: TextAlign.center),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: ButtonTheme(
                              minWidth: 0,
                              buttonColor: Color(0xFF212121),
                              padding: EdgeInsets.all(15),
                              child: RaisedButton(
                                onPressed: () {                                                                    
                                  displayDialog(context,
                                    title: "Ingresa el correo\nelectrónico de tu cuenta.",
                                    closeTitle: "Enviar",
                                    child: Column(
                                      children: <Widget>[
                                        DialogInput(
                                          controller: this.auser,
                                          placeholder: "",
                                        ),
                                        SizedBox(height: 40),
                                        Text("Recibirás una contraseña temporal para inciar\nsesión. ", textAlign: TextAlign.center, style: TextStyle(fontSize: 19, fontFamily: "Gotham-Black", fontWeight: FontWeight.bold)),
                                        SizedBox(height: 30)
                                      ],
                                    ),
                                    onPressed: () {                                      
                                      if(this.auser.text.length > 0){
                                        print(this.auser.text);
                                        Services.getRecoveryPassword(this.auser.text).then((res) {
                                          var obj = json.decode(res);
                                          switch(obj["code"]){
                                            case "210":{
                                              Navigator.pushNamed(context, "pwupdate", arguments: this.auser.text);
                                              break;
                                            }
                                            default: {
                                              Scaffold.of(context).showSnackBar(SnackBar(content: Text(obj["message"])));
                                            }
                                          }
                                        });
                                      }
                                    }
                                  );                               
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[                                    
                                    Text("Recuperala Aqui", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold))
                                  ]
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                          ),
                          SizedBox(height: 100)
                        ],
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: ButtonTheme(
                      buttonColor: Color(0xFFDA291C),
                      minWidth: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            FocusScope.of(context).requestFocus(new FocusNode());
                            Services.createSession(this.user.text, this.passwd.text).then((res) {
                              var obj = json.decode(res);
                              print(obj);                              
                              switch(obj['code']){
                                case "210": {                                  
                                  if(this.keepLogged)
                                    LocalData.db.addUser(User.fromJson(obj));
                                  else
                                    LocalData.db.addTempUser(User.fromJson(obj));
                                  Navigator.pushReplacementNamed(context, "home");
                                  break;
                                }
                                case "211": {
                                  Navigator.pushNamed(context, "pwupdate", arguments: this.user.text);
                                  break;
                                }
                                case "270": {
                                  displayDialog(context, 
                                    title: "Ingresa el correo de verificacion que se envio a tu correo",
                                    closeTitle: "Enviar",
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                    child: Column(
                                      children: <Widget>[
                                        DialogInput(
                                          controller: this.acode
                                        ),
                                        SizedBox(height: 20)
                                      ],
                                    ),
                                    onPressed: () {
                                      Services.activateAccount(this.user.text, this.acode.text).then((res) {
                                        var obj = json.decode(res);
                                        switch(obj["code"]){
                                          case "210": {                                              
                                            Navigator.pop(context);
                                            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Cuenta activada intenta logueate de nuevo")));
                                            break;
                                          }                                            
                                          case "230": {
                                            Navigator.pop(context);
                                            Scaffold.of(context).showSnackBar(SnackBar(content: Text(obj["message"])));
                                            break;
                                          }
                                        }
                                      });
                                    }
                                  );
                                  break;
                                }
                                default: {                                    
                                  Scaffold.of(context).showSnackBar(SnackBar(content: Text(obj["message"])));
                                  break;
                                }
                              }
                            });
                          }
                        },
                        child: Text("Entrar a Playrooms CK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),

                        padding: EdgeInsets.symmetric(vertical: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                        ),
                      )
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