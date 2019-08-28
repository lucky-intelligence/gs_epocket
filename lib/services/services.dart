import 'dart:async';

import 'package:playrooms/services/consumer.dart';

class Services {
  static bool enableDebug = true;
  static Future<String> createUser(name, firstLastName, secondLastName, String birth, email, mobile, password) async {
    return Consumer.consume(      
      url: "http://142.93.88.25:8080/LuckyCircleKServices/webresources/CreateUser",
      body: {
        "name": name,
        "firstSurName": firstLastName,
        "secondSurName": secondLastName,
        "birth": birth.split("/")[2]+"-"+birth.split("/")[1]+"-"+birth.split("/")[0],
        "email": email,
        "mobile": mobile,
        "password": password,
        "gender": "TBD",
        "picture": "TBD"        
      },
      debug: enableDebug
    );
  }  
  static Future<String> createSession(user, password) async {
    return Consumer.consume(      
      url: "http://142.93.88.25:8080/LuckyCircleKServices/webresources/CreateSession",
      body: {
        "user": user,
        "password": password,
        "environment": "playRooms",
        "sessionType": "mobile device",
        "sessionTypeDesc": "android"
      },
      debug: enableDebug
    );
  }
  static Future<String> activateAccount(user, code) async {
    return Consumer.consume(      
      url: "http://142.93.88.25:8080/LuckyCircleKServices/webresources/ActiveAccount",
      body: {
        "user": user,
        "activationCode": code
      },
      debug: enableDebug
    );
  }
  static Future<String> updatePassword(userId, currentPassword, newPassword) async {
    return Consumer.consume(      
      url: "http://142.93.88.25:8080/LuckyCircleKServices/webresources/UpdatePassword",
      body: {
        "userId": userId,
        "currentPassword": currentPassword,
        "newPassword": newPassword
      },
      debug: enableDebug
    );
  }
  static Future<String> getRecoveryPassword(user) async {
    return Consumer.consume(      
      url: "http://142.93.88.25:8080/LuckyCircleKServices/webresources/GetRecoveryPassword",
      body: {
        "user": user
      },
      debug: enableDebug
    );
  }
  static Future<String> getSession(session) async {
    return Consumer.consume(      
      url: "http://142.93.88.25:8080/LuckyCircleKServices/webresources/GetSession",
      body: {
        "session": session
      },
      debug: enableDebug
    );
  }
  static Future<String> removeSession(session) async {
    return Consumer.consume(      
      url: "http://142.93.88.25:8080/LuckyCircleKServices/webresources/DestroySession",
      body: {
        "session": session
      },
      debug: enableDebug
    );
  }

  static Future<String> getBankAmount(userId) async {
    return Consumer.consume(      
      url: "http://142.93.88.25:8080/LuckyCircleKServices/webresources/GetBankAmount",
      body: {
        "userId": userId
      },
      debug: enableDebug
    );
  }

  static Future<String> updateUser(name, firstLastName, secondLastName, String birth, email, mobile, password) async {
    return Consumer.consume(      
      url: "http://142.93.88.25:8080/LuckyCircleKServices/webresources/CreateUser",
      body: {
        "name": name,
        "firstSurName": firstLastName,
        "secondSurName": secondLastName,
        "birth": birth.split("/")[2]+"-"+birth.split("/")[1]+"-"+birth.split("/")[0],
        "email": email,
        "mobile": mobile,
        "password": password,
        "gender": "TBD",
        "picture": "TBD"        
      },
      debug: enableDebug
    );
  }
}

