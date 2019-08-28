import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playrooms/components/database/database.dart';
import 'package:playrooms/components/database/models/user.dart';
import 'package:playrooms/global_components/buttons/back_button.dart';
import 'package:playrooms/global_components/custom_dialog/custom_dialog.dart';
import 'package:playrooms/global_components/datepicker.dart';
import 'package:playrooms/global_components/textinput.dart';
import 'package:playrooms/services/services.dart';
import 'package:validators/validators.dart';

class Information extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InformationView();  
}

class InformationView extends State<Information>{

  TextEditingController name = new TextEditingController();
  TextEditingController fLN = new TextEditingController();
  TextEditingController sLN = new TextEditingController();  
  TextEditingController email = new TextEditingController();
  TextEditingController number = new TextEditingController();
  TextEditingController passwd = new TextEditingController();
  TextEditingController cpasswd = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {    
    Services.getSession(LocalData.user.session).then((session){
      User u = User.fromJson(json.decode(session));
      this.name.text = u.name;
      this.fLN.text = u.firstLastName;
      this.sLN.text = u.secondLastName;
      this.email.text = u.email;
      this.number.text = u.mobile;      
    });
    super.initState();
  }

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
              child: Back("home"),              
            )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(128),
                      border: Border.all(
                        color: Color(0xFFdf0117),
                        width: 2
                      )
                    ),
                    child: Stack(
                      children: <Widget>[                      
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add_a_photo, size: 24.0,),
                              color: Colors.white,
                              onPressed: (){},
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: Form(
                      key: this._formKey,
                      child: ListView(
                        scrollDirection: Axis.vertical,                        
                        children: <Widget>[
                          TextInput(controller: this.name, placeholder: "Nombre(s)", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";                            
                            if(!isLength(v, 1, 30)) return "El tamaño maximo son 30 caracteres";
                            return null;
                          }),
                          TextInput(controller: this.fLN, placeholder: "Apellido Paterno", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";                            
                            if(!isLength(v, 1, 30)) return "El tamaño maximo son 30 caracteres";
                            return null;
                          }),
                          TextInput(controller: this.sLN, placeholder: "Apellido Materno", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";                            
                            if(!isLength(v, 1, 30)) return "El tamaño maximo son 30 caracteres";
                            return null;
                          }),
                          TextInput(type: TextInputType.emailAddress, controller: this.email, placeholder: "Correo Electrónico", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";
                            if(!isEmail(v)) return "Por favor utiliza un email valido";
                            return null;
                          }),
                          TextInput(type: TextInputType.phone, controller: this.number, placeholder: "Teléfono Celular (10 Dígitos)", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";
                            if(!isNumeric(v)) return "Solo se permiten numeros en este campo";
                            if(!isLength(v, 1, 12)) return "El tamaño maximo son 12 numeros";
                            return null;
                          }),
                          SizedBox(height: 20),
                          Text("Actualizar Contraseña:", textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF2E2E2E), fontSize: 24)),
                          TextInput(passwordEnabled: true, controller: this.passwd, placeholder: "Nueva contraseña", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";      
                            if(!v.contains(RegExp(r'\d'), 0)) return "Debe contener al menos un numero";
                            if(!v.contains(new RegExp(r'[A-Z]'), 0)) return "Debe contener al menos una mayuscula";
                            if(!v.contains(RegExp(r'^[\w&.-]+$'), 0)) return "Debe contener al menos una caracter especial";
                            if(!isLength(v, 8)) return "Utiliza al menos 8 caracteres";                            
                            return null;
                          }),
                          TextInput(passwordEnabled: true, controller: this.cpasswd, placeholder: "Confirma nueva contraseña", validator: (v) {                            
                            if(v.isEmpty) return "Por favor rellena este campo";
                            if(v != this.passwd.text) return "Las contraseñas no coinciden";
                            return null;
                          }),
                          SizedBox(height: 20)
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
                          if(this._formKey.currentState.validate()){
                            displayDialog(context, 
                              title: "Actualización Exitosa",                            
                              child: Column(
                                children: <Widget>[                                
                                  SizedBox(height: 15),
                                  Text("Tus datos han sido\nactualizados.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: "Gotham-XLight")),
                                  SizedBox(height: 40)
                                ],
                              ),
                              onPressed: () => Navigator.pop(context)
                            );
                          }
                        },
                        child: Text("Guardar", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),

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