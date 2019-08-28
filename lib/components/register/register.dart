import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playrooms/global_components/datepicker.dart';
import 'package:playrooms/global_components/textinput.dart';
import 'package:playrooms/services/services.dart';
import 'package:validators/validators.dart';

class Register extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => RegisterView();
  
}

class RegisterView extends State<Register>{

  TextEditingController name = new TextEditingController();
  TextEditingController fLN = new TextEditingController();
  TextEditingController sLN = new TextEditingController();
  TextEditingController birth = new TextEditingController();  
  TextEditingController email = new TextEditingController();
  TextEditingController number = new TextEditingController();
  TextEditingController passwd = new TextEditingController();
  TextEditingController cpasswd = new TextEditingController();

  bool acceptedTerms = false;
  final _formKey = GlobalKey<FormState>();
  DateTime date;

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
                      key: _formKey,
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
                          DateInput(controller: this.birth, placeholder: "Fecha de Nacimiento", validator: (v) {
                            if(v.toString().isEmpty) return "Por favor rellena este campo";                            
                            if(!isDate(v.toString())) return "Introduce una fecha valida";
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
                            if(!isLength(v, 10)) return "El tamaño maximo son 10 numeros";
                            return null;
                          }),
                          TextInput(passwordEnabled: true, controller: this.passwd, placeholder: "Escribe una contraseña", validator: (v) {
                            if(v.isEmpty) return "Por favor rellena este campo";      
                            if(!v.contains(RegExp(r'\d'), 0)) return "Debe contener al menos un numero";
                            if(!v.contains(new RegExp(r'[A-Z]'), 0)) return "Debe contener al menos una mayuscula";
                            if(!v.contains(RegExp(r'^[\w&.-]+$'), 0)) return "Debe contener al menos una caracter especial";
                            if(!isLength(v, 8)) return "Utiliza al menos 8 caracteres";                            
                            return null;
                          }),
                          TextInput(passwordEnabled: true, controller: this.cpasswd, placeholder: "Confirma contraseña", validator: (v) {                            
                            if(v.isEmpty) return "Por favor rellena este campo";
                            if(v != this.passwd.text) return "Las contraseñas no coinciden";
                            return null;
                          }),
                          SizedBox(height: 15),
                          GestureDetector(
                            onTap: () => setState((){
                              this.acceptedTerms = !this.acceptedTerms;
                            }),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 27),
                              child: Container(
                                width: double.infinity,
                                height: 65,                              
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: Color(0xFFdf0117))),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Icon(Icons.check, size: 30.0, color: (this.acceptedTerms ? Color(0xFF2E2E2E) : Color(0x00)))
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Text("Acepto los términos y condiciones Lucky \nIntelligence S.A.P.I. de C.V. que puedes \nconsultar aquí.", style: TextStyle(color: Color(0xFFdf0117), fontStyle: FontStyle.italic))
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                          if (_formKey.currentState.validate() && this.acceptedTerms) {                                                      
                            Services.createUser(this.name.text.trim(), this.fLN.text.trim(), this.sLN.text.trim(), this.birth.text, this.email.text.trim(), this.number.text.trim(), this.passwd.text.trim()).then((success){
                              var obj = json.decode(success);
                              print(obj);
                              if(obj['playRoomsResponse'] != null){
                                print(obj['playRoomsResponse']['code']);
                                switch(obj['playRoomsResponse']['code']){
                                  case "210": {
                                    Navigator.popAndPushNamed(context, "/");
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Registrado Correctamente')));
                                    break;
                                  }
                                  case "541": {
                                    Navigator.popAndPushNamed(context, "/");                                    
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Registrado Correctamente')));
                                    break;
                                  }
                                  case "220": {
                                    Navigator.popAndPushNamed(context, "/");
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error interno intentalo mas tarde')));
                                    break;
                                  }
                                }
                              }else{
                                switch(obj['code']){
                                  case "210": {
                                    Navigator.popAndPushNamed(context, "/");
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Registrado Correctamente')));
                                    break;
                                  }
                                  case "220": {
                                    this.number.clear();
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Numero de telefono no disponible')));
                                    break;
                                  }
                                  case "240": {
                                    this.email.clear();
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Email no disponible')));
                                    break;
                                  }
                                  default: {
                                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error interno intentalo mas tarde')));
                                    break;
                                  }
                                }
                              }
                            });
                          }
                        },
                        child: Text("Crear Cuenta", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),

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