import 'dart:async';

import "package:http/http.dart" as http;
import "dart:convert";
import 'package:playrooms/services/encrypt.dart';

class Consumer {
  static Future<String> consume({url, body, debug}) async {
    print("request=${json.encode(body)}");
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8"
      },
      body: "request=${Uri.encodeComponent(Encrypt.encryptAES(json.encode(body)))}"
    );    
    if(debug){
      print(response.body);
      print(Encrypt.decryptAES(response.body));
    }
    return Encrypt.decryptAES(response.body);
  }
}