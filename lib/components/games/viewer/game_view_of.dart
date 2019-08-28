import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GameViewOF extends StatelessWidget{  

  @override
  Widget build(BuildContext context) {    
    dynamic args = ModalRoute.of(context).settings.arguments;
    return WebView(
      initialUrl: 'http://142.93.88.25/'+args['game'],
      userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (wbc) {
        wbc.evaluateJavascript("document.cookies = "+args['cookies']).then((a){          
        });
      },
    );
  }  
}