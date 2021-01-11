import 'package:drivxpro/components/Button.dart';
import 'package:drivxpro/components/OutlineButton.dart';
import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {

  final String title;
  final String subtitle;
  final Function press;

  Confirmation({this.title, this.subtitle, this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color:  Colors.black26,
            blurRadius: 15.0,
            spreadRadius: 0.5,
            offset: Offset(0.7,0.7),
        )
          ],
      ),
      height: 220,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            Text(title, textAlign: TextAlign.center,style:TextStyle(fontSize: 22, fontFamily: "Bolt-Semibold", color: Color(0xFF383635))),
            SizedBox(height: 20),
            Text(subtitle, textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF383635)),),
            SizedBox(height:30),
            Row(children: <Widget>[
              Expanded(child: Container(child: CustomOutlineButton(text: "Back", color: Color(0xFFe1e5e8) , press:(){Navigator.pop(context);} ))),
              SizedBox(width: 20),
              Expanded(child: Container(child: Button(text: "Confirm", color: (title == "GO ONLINE") ? Color(0xff29ab87) : Color(0xfff00000)  , press: press)))
            ],)
          ]
        ),
      )
    );
  }
}
