import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstappesin/controller/firestoreHelper.dart';
import 'package:firstappesin/globale.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsViewController extends StatefulWidget {
  Position gps;
  MapsViewController({Key? key, required this.gps}) : super(key: key);

  @override
  State<MapsViewController> createState() => _MapsViewControllerState();
}

class _MapsViewControllerState extends State<MapsViewController> {

  late CameraPosition cameraPositionInit;
  Completer<GoogleMapController> mapController = Completer();
  @override
  void initState() {
    // TODO: implement initState
    cameraPositionInit = CameraPosition(target: LatLng(widget.gps.latitude, widget.gps.longitude),zoom: 15);
    Map<String,dynamic> data = {
    "GPS":GeoPoint(widget.gps.latitude,widget.gps.longitude)
    };
    FirestoreHelper().updateUser(moi.uid, data);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,

      onMapCreated: (controller) async {
        String newStyle = await DefaultAssetBundle.of(context).loadString("lib/mapStyle.json");
        controller.setMapStyle(newStyle);
        mapController.complete(controller);
      },
        initialCameraPosition: cameraPositionInit,

    );
  }
}
