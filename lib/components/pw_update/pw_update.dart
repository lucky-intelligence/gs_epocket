import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playrooms/components/signin/login_input.dart';
import 'package:playrooms/global_components/custom_dialog/custom_dialog.dart';
import 'package:playrooms/services/services.dart';
import 'package:validators/validators.dart';

class PasswordUpdate extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => PasswordUpdateView();
  
}

class PasswordUpdateView extends State<PasswordUpdate>{

  TextEditingController opasswd = new TextEditingController();
  TextEditingController passwd = new TextEditingController();
  TextEditingController cpasswd = new TextEditingController();
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {  
    dynamic user = ModalRoute.of(context).settings.arguments;    
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
                  Expanded(
                    child: Form(
                      key: this._formKey,
                      child: ListView(                        
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          SizedBox(height: 80),
                          Text("Ingresaste usando\nuna contraseña temporal", textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
                          Text("Ingresas una nueva contraseña para continuar. Si cancelas el proceso o no se completa ahora, tendras que solicitar una nueva contraseña temporal.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
                          SizedBox(height: 10),
                          LoginInput(controller: this.opasswd, placeholder: "Contraseña Actual", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";                            
                            return null;
                          }),
                          LoginInput(controller: this.passwd, placeholder: "Nueva Contraseña", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";
                            if(!v.contains(RegExp(r'\d'), 0)) return "Debe contener al menos un numero";
                            if(!v.contains(new RegExp(r'[A-Z]'), 0)) return "Debe contener al menos una mayuscula";
                            if(!v.contains(RegExp(r'^[\w&.-]+$'), 0)) return "Debe contener al menos una caracter especial";
                            if(!isLength(v, 8)) return "Utiliza al menos 8 caracteres";   
                            return null;
                          }),
                          LoginInput(controller: this.cpasswd, placeholder: "Confirmar Contraseña", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";
                            if(this.passwd.text != v) return "Las contraseñas no coinciden";
                            return null;
                          }),
                          SizedBox(height: 150)
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
                            Services.updatePassword(user, this.opasswd.text, this.passwd.text).then((res){
                              var obj = json.decode(res);
                              switch(obj['code']){
                                case "210": {
                                  Navigator.pushReplacementNamed(context, "signin");                            
                                  displayDialog(context, 
                                    title: "Actualizacion Exitosa",
                                    child: Column(
                                      children: <Widget>[
                                        Text("Se ha actualizado\ntu contraseña exitosamente.", textAlign: TextAlign.center, style: TextStyle(fontSize: 19)),
                                        SizedBox(height: 40),
                                        Text("Inicia sesion con tu nueva contraseña para ingresar a Playrooms.", textAlign: TextAlign.center, style: TextStyle(fontSize: 19)),
                                        SizedBox(height: 30)
                                      ],
                                    ),
                                    onPressed: () => Navigator.pop(context)
                                  );
                                  break;
                                }
                                default: {
                                  Scaffold.of(context).showSnackBar(SnackBar(content: Text(obj["message"])));
                                }                                
                              }
                            }); 
                          }
                        },
                        child: Text("Actualizar Contraseña", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),

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