import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:playrooms/global_components/buttons/back_button.dart';

class ScanScreen extends StatefulWidget {  

  final CameraDescription camera;
  
  const ScanScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  ScanScreenState createState() => ScanScreenState();
  
}

class ScanScreenState extends State<ScanScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.ultraHigh,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          /*
          return Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: (snapshot.connectionState == ConnectionState.done ? CameraPreview(_controller) : Center(child: CircularProgressIndicator())),
              ),
              Positioned(
                left: 10,
                child: Back("home"),
              )
            ],
          );
          */
          var size = MediaQuery.of(context).size;
          return (snapshot.connectionState == ConnectionState.done ? 
          Stack(
            children: <Widget>[              
              Container(                
                child: CameraPreview(_controller)
              ),
              Positioned(left: 10, child: Back("home")),
            ]
          ): Center(child: CircularProgressIndicator()));
        },
      )
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}