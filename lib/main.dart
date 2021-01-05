import 'dart:io';
import 'package:drivxpro/constants.dart';
import 'package:drivxpro/routes.dart';
import 'package:drivxpro/screens/carScreen.dart';
import 'package:drivxpro/screens/mainScreen.dart';
import 'package:drivxpro/screens/signInScreen.dart';
import 'package:drivxpro/screens/signUpScreen.dart';
import 'package:drivxpro/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    options: Platform.isIOS || Platform.isMacOS
        ? FirebaseOptions(
      appId: '1:208461910166:ios:822a9b1a54443c0c29b2b7',
      apiKey: 'AIzaSyBXwNnIlA2i83rdz7vdq2il8Jc8hzBoVAU',
      projectId: 'drivx-d9475',
      messagingSenderId: '297855924061',
      databaseURL: 'https://drivx-d9475-default-rtdb.firebaseio.com',
    )
        : FirebaseOptions(
      appId: '1:208461910166:android:9b3ec11141631a8729b2b7',
      apiKey: 'AIzaSyDa40qijodFxtXH5eXDAHGI_shjXrxM_Ck',
      databaseURL: 'https://drivx-d9475-default-rtdb.firebaseio.com',
      messagingSenderId: '297855924061',
      projectId: 'drivx-d9475',
    ),
  );
  currentUser = FirebaseAuth.instance.currentUser;

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
    initialRoute: (currentUser != null ? MainScreen.routeName : MainScreen.routeName),
      routes: routes,
    );
  }
}
