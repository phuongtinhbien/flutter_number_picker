import 'package:flutter/material.dart';

import 'package:flutter_number_picker/flutter_number_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Container(
            width: 100,
            child: CustomNumberPicker(
              initialValue: 300,
              maxValue: 9999,
              minValue: 0,
              step: 100,
              onValue: (value) {
                print(value.toString());
              },
            ),
          ),
        ),
      ),
    );
  }
}
