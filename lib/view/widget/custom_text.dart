import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment textAlignment;
  final int maxLines;
  final double height;
  final String fontFamily;

  const CustomText(
      {this.text = "",
      this.fontSize = 16.0,
      this.color = Colors.black,
      this.textAlignment = Alignment.topLeft,
      this.maxLines,
      this.height,
      this.fontFamily});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: textAlignment,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            height: height,
            fontFamily: fontFamily),
        maxLines: maxLines,
      ),
    );
  }
}
