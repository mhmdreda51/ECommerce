import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color textColor;

  const CustomButton(
      {this.text,
      this.color = primaryColor,
      this.textColor = Colors.white,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(18.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      onPressed: onPressed as void Function(),
      child: CustomText(
        text: text,
        color: textColor,
        textAlignment: Alignment.center,
      ),
      color: color,
    );
  }
}
