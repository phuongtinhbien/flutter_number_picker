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
          title: const Text('Plutter number picker'),
        ),
        body: Center(
          child: Container(
            child: CustomNumberPicker(
              initialValue: 10000,
              maxValue: 1000000,
              minValue: 0,
              step: 10000,
              enable: true,
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
