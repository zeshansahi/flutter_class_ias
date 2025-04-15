import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image(
            image: AssetImage("images/bg_get_started.png"),
            fit: BoxFit.fill,
          ),
        ),
        Column(children: [
          
        ],)
      ]),
    );
  }
}
