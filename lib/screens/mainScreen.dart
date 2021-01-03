import 'package:drivxpro/components/Button.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";

class MainScreen extends StatefulWidget {
  static String routeName = "/mainScreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("kkk")),
      body: Center(child: Button(text:"vlivk", press:(){
        DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("testing");
        dbRef.set("test-connection");
      }))
    );
  }
}
