import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstappesin/controller/firestoreHelper.dart';
import 'package:firstappesin/globale.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapsViewController extends StatefulWidget {
  Position gps;
  MapsViewController({Key? key, required this.gps}) : super(key: key);

  @override
  State<MapsViewController> createState() => _MapsViewControllerState();
}

class _MapsViewControllerState extends State<MapsViewController> {
  @override
  void initState() {
    // TODO: implement initState
    Map<String,dynamic> data = {
    "GPS":GeoPoint(widget.gps.latitude,widget.gps.longitude)
    };
    FirestoreHelper().updateUser(moi.uid, data);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Text("long : ${widget.gps.longitude} - lattitude : ${widget.gps.latitude}");
  }
}
