import "package:flutter/material.dart";

void displayDialog(context, {title, child, buttonsChild, closeTitle, onPressed, padding}){
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(                                        
        titlePadding: EdgeInsets.only(left: 20, right: 20, top: 40),
        contentPadding: padding ?? EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
        title: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child,
            Center(
              child: buttonsChild ?? FlatButton(
                onPressed: onPressed ?? () => Navigator.pop(context),
                child: Text(closeTitle ?? "OK", style: TextStyle(color: Color(0xFF2C98F0), fontSize: 14)),
              )
            )
          ],
        )
      );
    }
  );
}