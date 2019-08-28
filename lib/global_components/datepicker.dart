import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:datetime_picker_formfield/datetime_picker_formfield.dart";

class DateInput extends StatelessWidget{
  
  String placeholder;
  EdgeInsets padding;
  TextAlign textAlign;
  TextEditingController controller;
  FormFieldValidator<DateTime> validator;
  var onChanged;

  DateInput({this.placeholder, this.textAlign, this.padding, this.controller, this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding: this.padding ?? EdgeInsets.only(top: 20, left: 30, right: 30),
      child: DateTimeField(
        validator: this.validator,
        controller: this.controller,
        textAlign: this.textAlign ?? TextAlign.left,
        format: DateFormat("dd/MM/yyyy"),        
        decoration: InputDecoration(
          hintText: this.placeholder,          
          border: OutlineInputBorder(),          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromRGBO(218, 41, 28, 1), width: 1)
          ),
          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
        ),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),            
            lastDate: DateTime(2100)
          );
        },
      ),
    );
  }  
}