import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class GetStarted extends StatefulWidget {
  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Image(
            image: AssetImage("images/splash_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        InkWell(
          onTap: ()=>{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OnBoarding()))
          },
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "You want Authentic, here you go!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Find it here, buy it now!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color(0xFFF83758),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
