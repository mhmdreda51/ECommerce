import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CusttomButtonSocial extends StatelessWidget {
  final String text;
  final Function onPressed;
  final String imageName;

  const CusttomButtonSocial(
      {@required this.text,
      @required this.onPressed,
      @required this.imageName});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade50,
      ),
      child: FlatButton(
        height: 50,
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(imageName),
            SizedBox(
              width: 100,
            ),
            CustomText(
              text: text,
              textAlignment: Alignment.center,
              color: Colors.black,
            )
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
