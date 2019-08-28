import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String username = "KiritoDev";
    String picUrl   = "asd";
  
    return Column(
      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[            
            Container(
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Text("awa"),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child:GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Center(child: Text("CREAR UN TORNEO", style: TextStyle(color: Colors.white70, fontSize:12.0, fontWeight: FontWeight.bold)))
                    ),
                    onTap: () => Navigator.pushNamed(context, "/tournaments/create"),
                  )
                ),
                Padding(padding: EdgeInsets.all(5)),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Center(child: Text("VER TORNEOS", style: TextStyle(color: Colors.white70, fontSize:12.0, fontWeight: FontWeight.bold)))
                    ),
                    onTap: () => Navigator.pushNamed(context, "/tournaments/my_tournaments"),
                  )
                )
              ]
            )
          ], mainAxisAlignment: MainAxisAlignment.start)
        ),

        //options
        Container(
          padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 80.0),
          decoration: BoxDecoration(
            color: Color(0xff1f1f1f)
          ),
          child: Column(
            children: <Widget>[
              ListTile(title: Text('Método de pago'        ,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)), onTap: () => Navigator.pushNamed(context, '/add_card')),
              ListTile(title: Text('Cuentas enlazadas'     ,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)), onTap: () => Navigator.pushNamed(context, '/linked_accounts')),
              ListTile(title: Text('Tienda'                ,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)), onTap: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text('Esto llevaria a la pantalla indicada (en desarrollo)')))),
              ListTile(title: Text('Soporte'               ,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)), onTap: () => Navigator.pushNamed(context, '/support') ),
              ListTile(title: Text('Terminos y condiciones',style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)), onTap: () => Navigator.pushNamed(context, '/terms')),
            ],
          )
        ),


      ],
    );
  }
  
  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }
}