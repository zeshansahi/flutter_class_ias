import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_ias/statemangment/providers/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderExample extends StatefulWidget {
  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double sValue = 1.0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SliderProvider sliderProvider=Provider.of(context,listen: false);

    print("Build");
    return Scaffold(
      body:Consumer<SliderProvider>(builder: (context,sliderProvider,child){
        return  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
                min: 0,
                max: 1,
                value: sliderProvider.sValue,
                onChanged: (onChanged) {
                  // sValue = onChanged;
                  // print("SliderValue::${sValue}");
                  // setState(() {});
                  sliderProvider.setSliderValue(onChanged);
                }),
            Row(
              children: [
                Expanded(
                  child: Container(
                      height: 50,
                      color: Colors.green.withOpacity(sliderProvider.sValue),
                      child: Center(child: Text("Box one"))),
                ),
                Expanded(
                  child: Container(
                      height: 50,
                      color: Colors.red.withOpacity(sliderProvider.sValue),
                      child: Center(child: Text("Box two"))),
                ),
              ],
            )
          ],
        );
      })
    );
  }
}
