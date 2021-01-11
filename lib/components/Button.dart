import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    this.text,
    this.color,
    this.press,
  }) : super(key: key);
  final String text;
  final Color color;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 50,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: (color == null) ? Color(0xfff00000) :color,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Bolt-Semibold',
            color: Colors.white,
          ),
        ),
      )
      );
  }
}