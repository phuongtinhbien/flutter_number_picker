

Flutter Number Picker is a custom widget designed for choosing an integer or decimal number by using add and minus buttons.


## Getting Started
#### Creating FlutterNumberPicker Widget

```dart
CustomNumberPicker(
              initialValue: 10000,
              maxValue: 1000000,
              minValue: 0,
              step: 10000,
              onValue: (value) {
                print(value.toString());
              },
            )
```
### Usage examples
See examples directory for full examples.

#### Standalone widget
![vertical](https://raw.githubusercontent.com/MarcinusX/NumberPicker/master/example/screenshots/gif_widget.gif)
```dart
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


```


