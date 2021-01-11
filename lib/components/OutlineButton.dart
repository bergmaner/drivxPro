import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {

  final String text;
  final Function press;
  final Color color;

  CustomOutlineButton({this.text, this.press, this.color});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        borderSide: BorderSide(color: color),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
        onPressed: press,
        color: color,
        textColor: color,
        child: Container(
          height: 50.0,
          child: Center(
            child: Text(text,
                style: TextStyle(fontSize: 15.0, fontFamily: 'Bolt-Semibold', color: Color(0xFF383635))),
          ),
        )
    );
  }
}
