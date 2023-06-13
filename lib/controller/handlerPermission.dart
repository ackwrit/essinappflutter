import 'package:permission_handler/permission_handler.dart';

class HanlderPermission{

  init() async {
    PermissionStatus statuts = await Permission.photos.status;
    checkVerification(statuts);
  }


  Future<PermissionStatus >checkVerification(PermissionStatus statuts){
    switch(statuts){
      case PermissionStatus.permanentlyDenied : return Future.error("ne souhaite qu'on accède à ses photos");
      case PermissionStatus.denied : return Permission.photos.request().then((value) =>  checkVerification(statuts));
      case PermissionStatus.restricted : return Permission.photos.request().then((value) =>  checkVerification(statuts));
      case PermissionStatus.limited : return Permission.photos.request().then((value) =>  checkVerification(statuts));
      case PermissionStatus.granted : return Permission.photos.status;
      default : return Future.error("erreur");
    }

  }
}