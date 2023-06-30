import 'package:flutter/material.dart';

class Tools {
  Color getComplementaryColor(Color color) {
    return Color.fromRGBO(
        255 - color.red, 255 - color.green, 255 - color.blue, 1);
  }
}
