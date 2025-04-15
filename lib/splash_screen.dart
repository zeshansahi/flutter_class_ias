import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'get_started.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Image(image: AssetImage("images/splash_logo.png")),
      ),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>GetStarted()));
  }
}
