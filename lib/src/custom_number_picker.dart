import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_number_picker/src/res.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNumberPicker extends StatefulWidget {
  final Border border;
  final TextStyle valueTextStyle;
  final Function(dynamic) onValue;
  final dynamic maxValue;
  final dynamic minValue;
  final dynamic initialValue;
  final dynamic step;

  CustomNumberPicker(
      {Key key,
      this.border,
      this.valueTextStyle,
      @required this.onValue,
      @required this.initialValue,
      @required this.maxValue,
      @required this.minValue,
      this.step = 1})
      : super(key: key);

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
  Timer _timer;

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
    return Container(
      height: 30,
      decoration: BoxDecoration(
          border:
              widget.border ?? Border.all(width: 1, color: Color(0xffF0F0F0))),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: minus,
            onTapDown: (details) {
              onLongPress(DoAction.MINUS);
            },
            onTapUp: (details) {
              _timer.cancel();
            },
            onTapCancel: () {
              _timer.cancel();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 6, right: 6, bottom: 6, top: 6),
              child: SvgPicture.asset(
                Res.ic_minus,
                height: 15,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 6, top: 6),
              child: Center(
                child: Text(
                  "$_initialValue",
                  style: widget.valueTextStyle ?? TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: add,
            onTapDown: (details) {
              onLongPress(DoAction.ADD);
            },
            onTapUp: (details) {
              _timer.cancel();
            },
            onTapCancel: () {
              _timer.cancel();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 6, right: 6, bottom: 6, top: 6),
              child: SvgPicture.asset(
                Res.ic_add,
                height: 15,
              ),
            ),
          )
        ],
      ),
    );
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
  }
}

enum DoAction { MINUS, ADD }