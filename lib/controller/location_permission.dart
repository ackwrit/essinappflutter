import 'package:geolocator/geolocator.dart';

class LocationManager{


  Future<Position> init() async {
    bool isLocated = await Geolocator.isLocationServiceEnabled();
    if (isLocated){
      LocationPermission  permission = await Geolocator.checkPermission();
      return checkPermissionLocation(permission);
    }
    else
      {
        return Future.error("L'accès au gps n'est pas activé");
      }

  }


  Future <Position>checkPermissionLocation(LocationPermission permmission){
    switch (permmission){
      case LocationPermission.unableToDetermine : return Future.error("Nous n'arrivons pas à vous positinnez");
      case LocationPermission.deniedForever : return Future.error("Nous n'avons pas accès à vos données");
      case LocationPermission.denied : return Geolocator.requestPermission().then((value) => checkPermissionLocation(value));
      case LocationPermission.whileInUse : return Geolocator.getCurrentPosition();
      case LocationPermission.always : return Geolocator.getCurrentPosition();

    }


  }
}