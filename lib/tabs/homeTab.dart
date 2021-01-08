import 'dart:async';
import 'package:drivxpro/components/Button.dart';
import 'package:drivxpro/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();

  Position currentPosition;
  DatabaseReference tripRef;

  var geolocator = Geolocator();
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.bestForNavigation,distanceFilter: 4);

  void getCurrentPosition() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    LatLng pos= LatLng(position.latitude, position.longitude);
    mapController.animateCamera(CameraUpdate.newLatLng(pos));

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          myLocationEnabled:  true,
          myLocationButtonEnabled: true,
          zoomGesturesEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: googlePlex,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
            mapController = controller;
            getCurrentPosition();
          },
        ),
        Container(
          height: 125,
          width: double.infinity,
          color: Color(0xffffffff),
        ),
        Positioned(
          top:45,
          left:0,
          right:0,
          child:
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Button(text:"Go Online",press: (){
        goOnline();
        getLocationUpdate();
      },),
    )
          )
      ],
    );
  }

  void goOnline (){
    print('f f ${currentPosition.longitude}');
    Geofire.initialize("driversAvaible");
    Geofire.setLocation(currentUser.uid, currentPosition.latitude,currentPosition.longitude);
    tripRef = FirebaseDatabase.instance.reference().child('drivers/${currentUser.uid}/newTrip');
    tripRef.set("waiting");
    tripRef.onValue.listen((event) {

    });
  }

  void getLocationUpdate(){
    homeStreamPosition = geolocator.getPositionStream(locationOptions).listen((Position position) {
      currentPosition = position;
      Geofire.setLocation(currentUser.uid, position.latitude, position.longitude);
      LatLng pos = LatLng(position.latitude, position.longitude);
      mapController.animateCamera(CameraUpdate.newLatLng(pos));
    });
  }
}

