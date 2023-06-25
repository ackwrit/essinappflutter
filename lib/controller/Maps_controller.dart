import 'package:firstappesin/controller/MapsViewController.dart';
import 'package:firstappesin/controller/NoDataMapsController.dart';
import 'package:firstappesin/controller/firestoreHelper.dart';
import 'package:firstappesin/controller/location_permission.dart';
import 'package:firstappesin/globale.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapsController extends StatefulWidget {
  const MapsController({Key? key}) : super(key: key);

  @override
  State<MapsController> createState() => _MapsControllerState();
}

class _MapsControllerState extends State<MapsController> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
      future: LocationManager().init(),
        builder: (context,snap){
            if(snap.hasData){
              Position position = snap.data!;
              return MapsViewController(gps: position);
            }
            else
              {
                return const NoDataMapsController();
              }
        }
    );
  }
}
