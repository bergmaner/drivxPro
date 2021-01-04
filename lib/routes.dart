import 'package:drivxpro/screens/carScreen.dart';
import 'package:drivxpro/screens/forgotPasswordScreen.dart';
import 'package:drivxpro/screens/mainScreen.dart';
import 'package:drivxpro/screens/signInScreen.dart';
import 'package:drivxpro/screens/signUpScreen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  MainScreen.routeName: (context) => MainScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CarScreen.routeName: (context) => CarScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
};