import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_number_picker/src/res.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNumberPicker extends StatefulWidget {
  final ShapeBorder? shape;
  final TextStyle? valueTextStyle;
  final Function(dynamic) onValue;
  final Widget? customAddButton;
  final Widget? customMinusButton;
  final dynamic maxValue;
  final dynamic minValue;
  final dynamic initialValue;
  final dynamic step;

  CustomNumberPicker(
      {Key? key,
      this.shape,
      this.valueTextStyle,
      required this.onValue,
      required this.initialValue,
      required this.maxValue,
      required this.minValue,
      this.step = 1,
      this.customAddButton,
      this.customMinusButton})
      : assert(initialValue != null),
        assert(initialValue.runtimeType != String),
        assert(maxValue.runtimeType == initialValue.runtimeType),
        assert(minValue.runtimeType == initialValue.runtimeType),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomNumberPickerState();
  }
}

class CustomNumberPickerState extends State<CustomNumberPicker> {
  dynamic _initialValue;
  dynamic _maxValue;
  dynamic _minValue;
  dynamic _step;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialValue = widget.initialValue;
    _maxValue = widget.maxValue;
    _minValue = widget.minValue;
    _step = widget.step;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Card(
      shadowColor: Colors.transparent,
      elevation: 0.0,
      semanticContainer: true,
      color: Colors.transparent,
      shape: widget.shape ??
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              side: BorderSide(width: 1.0, color: Color(0xffF0F0F0))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: minus,
              onTapDown: (details) {
                onLongPress(DoAction.MINUS);
              },
              onTapUp: (details) {
                _timer?.cancel();
              },
              onTapCancel: () {
                _timer?.cancel();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 6, right: 6, bottom: 6, top: 6),
                child: widget.customMinusButton ??
                    SvgPicture.asset(
                      Res.ic_minus,
                      height: 15,
                    ),
              ),
            ),
            Container(
              width: _textSize(widget.valueTextStyle ?? TextStyle(fontSize: 14))
                  .width,
              child: Text(
                "$_initialValue",
                style: widget.valueTextStyle ?? TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: add,
              onTapDown: (details) {
                onLongPress(DoAction.ADD);
              },
              onTapUp: (details) {
                _timer?.cancel();
              },
              onTapCancel: () {
                _timer?.cancel();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 6, right: 6, bottom: 6, top: 6),
                child: widget.customAddButton ??
                    SvgPicture.asset(
                      Res.ic_add,
                      height: 15,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Size _textSize(TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: _maxValue.toString(), style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(
          minWidth: 0, maxWidth: _maxValue.toString().length * style.fontSize!);
    return textPainter.size;
  }

  void minus() {
    if (canDoAction(DoAction.MINUS)) {
      setState(() {
        _initialValue -= _step;
      });
    }
    widget.onValue(_initialValue);
  }

  void add() {
    if (canDoAction(DoAction.ADD)) {
      setState(() {
        _initialValue += _step;
      });
    }
    widget.onValue(_initialValue);
  }

  void onLongPress(DoAction action) {
    var timer = Timer.periodic(Duration(milliseconds: 300), (t) {
      action == DoAction.MINUS ? minus() : add();
    });
    setState(() {
      _timer = timer;
    });
  }

  bool canDoAction(DoAction action) {
    if (action == DoAction.MINUS) {
      return _initialValue - _step >= _minValue;
    }
    if (action == DoAction.ADD) {
      return _initialValue + _step <= _maxValue;
    }
    return false;
  }
}

enum DoAction { MINUS, ADD }
