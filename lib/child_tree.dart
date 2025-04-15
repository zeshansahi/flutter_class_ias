

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.white,
        child: Center(
          child: Container(
            height: 150,
            width: 150,
            color: Colors.blueGrey,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}