import 'package:flutter/material.dart';

class Button {
  final id;
  String text;
  Color bg;
  bool enabled;
  int num;

  Button(
      {this.id, this.text = "", this.bg = Colors.grey, this.enabled = true, this.num = 0});
}
