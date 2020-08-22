

Flutter Number Picker is a custom widget designed for choosing an integer or decimal number by using add and minus buttons.


## Getting Started
1. Head to `/pubspec.yaml` and add below dependencies like this:
```
dependencies:
  flutter:
    sdk: flutter
  flutter_number_picker:
      git: https://github.com/phuongtinhbien/flutter_number_picker.git
```
2. Run `flutter packages get` or use the GUI equivalent
3. Now in your code `import 'package:flutter_number_picker/flutter_number_picker.dart';`
4. You're ready to go!
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
### Attribute
- `minValue` [required] is the minimum value of the ButtonPicker.
- `maxValue` [required] is the maximum value of the ButtonPicker.
- `initialValue` [required] is the value displayed on load.
- `onValue` [required] returns the current value.
- `step` defines how much the value should increase or decrease on tap. [default] = 1.
- `valueTextStyle` is the `TextStyle` of the value.
- `shape` is the `ShapeBorder` of the picker.

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


