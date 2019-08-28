import 'package:flutter/material.dart';

class TextInput extends StatefulWidget{
  String placeholder;
  EdgeInsets padding;
  TextAlign textAlign;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType type;
  bool passwordEnabled;

  TextInput({this.placeholder, this.padding, this.textAlign, this.controller, this.validator, this.type, this.passwordEnabled});

  @override
  State<StatefulWidget> createState() => TextInputView(placeholder: this.placeholder, padding: this.padding, textAlign: this.textAlign, controller: this.controller, validator: this.validator, type: this.type, passwordEnabled: this.passwordEnabled);
  
}

class TextInputView extends State<TextInput>{

  String placeholder;
  EdgeInsets padding;
  TextAlign textAlign;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType type;
  bool passwordEnabled;

  TextInputView({this.placeholder, this.padding, this.textAlign, this.controller, this.validator, this.type, this.passwordEnabled});
  bool hiddenPass = true;

  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding: this.padding ?? EdgeInsets.only(top: 20, left: 30, right: 30),      
      child: TextFormField(
        controller: this.controller,
        textAlign: this.textAlign ?? TextAlign.left,
        validator: this.validator,
        obscureText: (this.passwordEnabled ?? false) ? this.hiddenPass : false,
        keyboardType: type ?? TextInputType.text,
        decoration: InputDecoration(          
          hintText: this.placeholder,
          border: OutlineInputBorder(),
          suffixIcon: this.passwordEnabled ?? false ? GestureDetector(
              onTap: (){ setState(() {
                this.hiddenPass = !this.hiddenPass;
              }); },
              child: Icon( this.hiddenPass ? Icons.visibility : Icons.visibility_off, color: Color(0xFF212121)),
            ) : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromRGBO(218, 41, 28, 1), width: 1)
          ),
          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
        ),
      ),
    );
  }  
}