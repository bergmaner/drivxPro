import 'package:drivxpro/components/Button.dart';
import 'package:drivxpro/components/FormError.dart';
import 'package:drivxpro/components/Icon.dart';
import 'package:drivxpro/constants.dart';
import 'package:drivxpro/screens/mainScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CarScreen extends StatefulWidget {
  static String routeName = "/carScreeen";
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  var carModelController = TextEditingController();
  var carColorController = TextEditingController();
  var carNumberController = TextEditingController();

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void updateProfile(context){
    String uid = currentUser.uid;
    DatabaseReference driverRef = FirebaseDatabase.instance.reference().child('drivers/$uid/car_details');

    Map carMap = {
        "car_model": carModelController.text,
        "car_color": carColorController.text,
        "car_number": carNumberController.text

    };

    driverRef.set(carMap);
    Navigator.pushNamed(context, MainScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child:Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40),
                        Text("Enter car details", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        SizedBox(height: 25),
                        TextFormField(
                          controller: carModelController,
                          decoration: InputDecoration(
                              labelText: "Car Model",
                              hintText: "Enter your car model",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              suffixIcon:CustomIcon(svgIcon:"assets/icons/car.svg", height: 35)
                          ),

                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          controller: carColorController,
                          decoration: InputDecoration(
                              labelText: "Car Color",
                              hintText: "Enter your car color",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              suffixIcon:CustomIcon(svgIcon:"assets/icons/color.svg", height: 35)
                          ),

                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          controller: carNumberController,
                          decoration: InputDecoration(
                              labelText: "Car Number",
                              hintText: "Enter your car number",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              suffixIcon:CustomIcon(svgIcon:"assets/icons/carNumber.svg", height: 35)
                          ),

                        ),
                        SizedBox(height:25),
                        FormError(errors: errors),
                        SizedBox(height: 25),
                        Button(text: "Enter data", press:(){
                          print("xdd");
                          if(carModelController.text.length < 3){
                            addError(error:'Please provide a valid car model');
                          }
                          else removeError(error:'Please provide a valid car model');

                          if(carColorController.text.length < 3){
                            addError(error:'Please provide a valid car color');
                          } else removeError(error:'Please provide a valid car color');

                          if(carNumberController.text.length < 3){
                            addError(error: 'Please provide a valid vehicle number');
                          }
                          else removeError(error: 'Please provide a valid vehicle number');

                          if(errors.length < 1) updateProfile(context);

                        })
                      ],
                    )
                )
            )
        )
    );
  }
}

