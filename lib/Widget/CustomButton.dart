
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({Key key, this.height, this.width, this.isBold = true, this.padding, this.fontSize, this.bgColor, this.txtColor, this.text,this.onPressed})
      : super(key: key);

  Color bgColor;
  Color txtColor;
  String text;
  double height;
  double width;
  double fontSize;
  double padding;
  bool isBold;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: height ?? 60,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(text, style: TextStyle(
            color: txtColor,
            fontSize: fontSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal
        ),),
      ),
      onTap: onPressed,
    );
  }
}
