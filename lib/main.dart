import 'package:flutter/material.dart';
import 'package:flutter_class_ias/splash_screen.dart';
import 'package:flutter_class_ias/statemangment/providers/counter_provider.dart';
import 'package:flutter_class_ias/statemangment/providers/slider_provider.dart';
import 'package:flutter_class_ias/statemangment/slider_example.dart';
import 'package:provider/provider.dart';

import 'child_tree.dart';
import 'favouriteapp/favourit_ui.dart';
import 'get_started.dart';
import 'statemangment/counter_example.dart';

void main() {
  print("Main function call");
  runApp(MyAppStateFull());
}

class MyAppStateFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_)=>CounterProvider()),
      ChangeNotifierProvider(create: (_)=>SliderProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FavouritAppScreen(),
      // home: WidgetTree(),
    ) ,);

    // return ChangeNotifierProvider(
    //   create: (_) => CounterProvider(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: SliderExample(),
    //     // home: WidgetTree(),
    //   ),
    // );

    // return  MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: CounterExample(),
    //   // home: WidgetTree(),
    // );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("My app widget rebuild");
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                color: Colors.blue,
                child: Center(child: Text("Drawer")),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add new User"),
            ),
            ListTile(
              leading: Icon(Icons.notification_add),
              title: Text("Notification"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Hor restart with r"),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: 100,
                height: 100,
                child: Image(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/9432524/pexels-photo-9432524.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))),
            Container(
                width: 100,
                height: 100,
                child: Image(image: AssetImage("images/pic_one.jpg"))),
            Container(
                width: 100,
                height: 100,
                child: Image(image: AssetImage("images/pic_two.jpg")))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.add),
            Icon(Icons.phone),
            Icon(Icons.notification_add),
          ],
        ),
      ),
    );
  }
}
