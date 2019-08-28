import 'package:flutter/material.dart';


class HeaderInput extends StatefulWidget{

  String placeholder;
  EdgeInsets padding;
  TextAlign textAlign;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType type;
  bool passwordEnabled;

  HeaderInput({this.placeholder, this.padding, this.textAlign, this.controller, this.validator, this.type, this.passwordEnabled});

  @override
  State<StatefulWidget> createState() => HeaderInputView(placeholder: this.placeholder, padding: this.padding, textAlign: this.textAlign, controller: this.controller, validator: this.validator, type: this.type, passwordEnabled: this.passwordEnabled);
  
}

class HeaderInputView extends State<HeaderInput>{

  String placeholder;
  EdgeInsets padding;
  TextAlign textAlign;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType type;
  bool passwordEnabled;

  HeaderInputView({this.placeholder, this.padding, this.textAlign, this.controller, this.validator, this.type, this.passwordEnabled});
  bool hiddenPass = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Color(0xFFF2F5F2),
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
          controller: this.controller,
          textAlign: TextAlign.left,
          validator: this.validator,
          obscureText: (this.passwordEnabled ?? false) ? this.hiddenPass : false,
          keyboardType: type ?? TextInputType.text,
          decoration: InputDecoration(
            fillColor: Color(0xFFDA291C),
            suffixIcon: this.passwordEnabled ?? false ? GestureDetector(
              onTap: (){ setState(() {
                this.hiddenPass = !this.hiddenPass;
              }); },
              child: Icon( this.hiddenPass ? Icons.visibility : Icons.visibility_off, color: Color(0xFF212121)),
            ) : null,
            hintText: this.placeholder,
            border: InputBorder.none,            
            hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0x30000000))
          ),
        ),
      )
    );
  }  
}