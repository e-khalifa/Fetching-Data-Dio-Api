import 'package:fetching_data_dio_api/utils/color_utility.dart';
import 'package:flutter/material.dart';

class TextUtility {
  static Text title(
    String text, {
    Color color = ColorUtility.mediumGrey,
    double size = 22,
    FontWeight weight = FontWeight.w800,
    TextAlign textAlign = TextAlign.center,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }

  static Text subtitle(String text,
      {Color color = ColorUtility.mediumPurple,
      double size = 15,
      FontWeight weight = FontWeight.w400}) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }

  static Text basic(
    String text, {
    Color color = ColorUtility.deepPurple,
    double size = 14,
  }) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }

  static Text body(
    String text, {
    Color color = ColorUtility.mediumGrey,
    double size = 14,
  }) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
