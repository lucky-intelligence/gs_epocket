import 'package:flutter/material.dart';
import 'package:playrooms/components/challenges/challenges.dart';
import 'package:playrooms/components/challenges/challenges_detail.dart';
import 'package:playrooms/components/exchanges/exchanges.dart';
import 'package:playrooms/components/exchanges/exchanges_detail.dart';
import 'package:playrooms/components/games/game.dart';
import 'package:playrooms/components/games/viewer/game_view_of.dart';
import 'package:playrooms/components/home/home.dart';
import 'package:playrooms/components/information/information.dart';
import 'package:playrooms/components/login/login.dart';
import 'package:playrooms/components/notifications/notifications.dart';
import 'package:playrooms/components/notifications/notifications_detail.dart';
import 'package:playrooms/components/pw_update/pw_update.dart';
import 'package:playrooms/components/register/register.dart';
import 'package:camera/camera.dart';
import 'package:playrooms/components/scan/scan.dart';
import 'package:playrooms/components/signin/signin.dart';

class Router {
  
  CameraDescription camera;

  Future<CameraDescription> getCamera() async{
    final cameras = await availableCameras();    
    return cameras.first;
  }

  Router () {
    this.getCamera().then((c) => this.camera = c);
    runApp(new MaterialApp(
      title: "Circulo K ",
      theme: ThemeData(
        primaryColor: Color(0xFFDA291C),
        accentColor: Colors.deepPurple,
        canvasColor: Colors.white
      ),
      routes: {
        "/": (BuildContext context) => render(Login()),
        //"register": (BuildContext context) => render(Register()),
        "signin": (BuildContext context) => render(Signin()),
        //"pwupdate": (BuildContext context) => render(PasswordUpdate()),
        "home": (BuildContext context) => render(Home()),
        //"game": (BuildContext context) => render(Game()),
        //"information": (BuildContext context) => render(Information()),
        "exchanges": (BuildContext context) => render(Exchanges()),
        "exchanges_detail": (BuildContext context) => render(ExchangesDetail()),
        //"challenges": (BuildContext context) => render(Challenges()),
        //"challenges_detail": (BuildContext context) => render(ChallengesDetail()),
        //"notifications": (BuildContext context) => render(Notifications()),
        //"notifications_detail": (BuildContext context) => render(NotificationDetail()),        
        "scan": (BuildContext context) => render(ScanScreen(camera: this.camera)),
        //"game_view": (BuildContext context) => render(GameView()),
        //"game_view_of": (BuildContext context) => render(GameViewOF())
      },
      initialRoute: "/"
    ));
  }
  
  render(module) => Scaffold(
    backgroundColor: Color(0xff141414),    
    body: SafeArea(child: module));
}