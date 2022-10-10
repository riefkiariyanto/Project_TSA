import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFirstPage(),
    );
  }
}

class MyFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.blueGrey,
            child: Center(
              child: SizedBox(
                width: 350,
                child: TextLiquidFill(
                  loadDuration: Duration(seconds: 7),
                  waveDuration: Duration(seconds: 1),
                  text: 'Hello Word',
                  waveColor: Colors.white,
                  boxBackgroundColor: Colors.blueGrey,
                  textStyle:
                      TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
                ),
              ),
            )),
      ),
    );
  }
}
