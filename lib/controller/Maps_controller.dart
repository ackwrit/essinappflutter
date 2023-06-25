import 'package:firstappesin/controller/location_permission.dart';
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
              print(position.latitude);
              print(position.longitude);
              return Text("Afficher la carte");
            }
            else
              {
                return Text("ne pas Afficher la carte");
              }
        }
    );
  }
}
