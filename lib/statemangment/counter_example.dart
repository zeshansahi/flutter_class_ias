import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_ias/statemangment/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterExample extends StatefulWidget {
  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);

    Timer.periodic(Duration(seconds: 1), (callback) {
      counterProvider.setCounter();
      // count++;
      // print("$count");
      // setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    CounterProvider counterProvider = Provider.of<CounterProvider>(context);

    print("Build");
    return Scaffold(
        body: Consumer<CounterProvider>(builder: (context,provider,child){
          return Center(
              child: Text(
                "${counterProvider.count}",
                style: TextStyle(fontSize: 50),
              ));
        }));
  }
}
