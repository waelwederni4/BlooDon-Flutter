import 'package:flutter/material.dart';

class FirstScreenModel {
  String title;
  String description;
  Color titleColor;
  Color descripColor;
  String imagePath;

  FirstScreenModel({
    @required this.title,
    @required this.description,
    @required this.imagePath,
    @required this.titleColor,
    @required this.descripColor,
  });
}