import 'package:flutter/material.dart';

class TextClass {
  setText(String title, {int? maxLines, FontWeight? fontWeight, double? fontSize, Color textColor = Colors.black}){
    return Text(title, maxLines : maxLines,style: TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: textColor),);
  }
}