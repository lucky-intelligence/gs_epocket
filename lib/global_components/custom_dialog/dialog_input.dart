import 'package:flutter/material.dart';

class DialogInput extends StatelessWidget{

  String placeholder;
  TextEditingController controller;

  DialogInput({this.placeholder, this.controller});

  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 30, right: 30),
      child: TextFormField(
        controller: this.controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(        
          enabledBorder: UnderlineInputBorder(      
            borderSide: BorderSide(color: Color(0xFFDA291C), width: 3),
          ),
          focusedBorder: UnderlineInputBorder(      
            borderSide: BorderSide(color: Color(0xFFDA291C), width: 3),
          ),
        ),
      )
    );
  }  
}