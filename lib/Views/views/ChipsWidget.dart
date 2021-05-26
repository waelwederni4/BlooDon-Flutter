import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipsWidget extends StatefulWidget {
  final String chipName;

  ChipsWidget({Key key, this.chipName}) : super(key: key);

  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipsWidget> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
          color: Color(0xFF8D1616),
          fontSize: 16.0,
          fontWeight: FontWeight.bold),
      selected: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Color(0xffededed),
      selectedColor: Color(0xffb3d1ff),
    );
  }
}