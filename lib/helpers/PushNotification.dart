import 'dart:io' show Platform;
import 'package:drivxpro/components/ProgressDialog.dart';
import 'package:drivxpro/constants.dart';
import 'package:drivxpro/datamodels/TripDetails.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PushNotification{

  final FirebaseMessaging fm = FirebaseMessaging();

  Future initialize(context) async{
    print("fff");

    fm.configure(

      onMessage: (Map<String, dynamic> message) async {
        fetchRideInfo(getRideID(message), context);
      },
      onLaunch: (Map<String, dynamic> message) async {
        fetchRideInfo(getRideID(message), context);
      },
      onResume: (Map<String, dynamic> message) async {
        fetchRideInfo(getRideID(message), context);
        },

    );
  }

  Future <String> getToken() async{
    String token = await fm.getToken();
    print('token: $token');

    DatabaseReference tokenRef = FirebaseDatabase.instance.reference().child('drivers/${currentUser.uid}/token');
    tokenRef.set(token);
    fm.subscribeToTopic("allDrivers");
    fm.subscribeToTopic("allUsers");
  }
}

String getRideID(Map<String, dynamic> message){
  String rideID = "";

  if (Platform.isAndroid) {
     rideID = message["data"]["ride_id"];
  }
  else{
   rideID = message["ride_id"];
  }
  return rideID;
}

void fetchRideInfo(String rideID, context){

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => ProgressDialog(status: "Fetching data...")
    );

    DatabaseReference rideRef = FirebaseDatabase.instance.reference().child('rideRequest/$rideID');
    rideRef.once().then((DataSnapshot snapshot){

    Navigator.pop(context);

    if(snapshot.value != null){
      double pickupLat = double.parse(snapshot.value['location']['latitude'].toString());
      double pickupLng = double.parse(snapshot.value['location']['longitude'].toString());
      String pickupAddress = snapshot.value['pickup_address'];

      double destinationLat = double.parse(snapshot.value['destination']['latitude'].toString());
      double destinationLng = double.parse(snapshot.value['destination']['longitude'].toString());
      String destinationAddress = snapshot.value['destination_address'];
      String paymentMethod = snapshot.value['payment_method'];

      TripDetails tripDetails = TripDetails();

      tripDetails.rideID = rideID;
      tripDetails.pickupAddress = pickupAddress;
      tripDetails.destinationAddress = destinationAddress;
      tripDetails.pickup = LatLng(pickupLat, pickupLng);
      tripDetails.destination = LatLng(destinationLat, destinationLng);
      tripDetails.paymentMethod = paymentMethod;

    }

  });
}