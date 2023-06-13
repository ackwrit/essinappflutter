
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstappesin/globale.dart';

class MyUser {
  late String uid;
  late String nickName;
  late String lastName;
  late String name;
  late String email;
  DateTime? birthday;
  String? avatar;


  //Constructeur
  MyUser(){
    uid = "";
  nickName = "";
  lastName = "";
  name = "";
  email = "";



}

  MyUser.database(DocumentSnapshot snapshot){
    uid = snapshot.id;
    Map<String,dynamic>  map = snapshot.data() as Map<String,dynamic>;
    nickName = map["PSEUDO"];
    lastName = map["NOM"];
    name = map["PRENOM"];
    email = map["EMAIL"];
    Timestamp? provisoire = map ["BIRTHDAY"];
    if(provisoire == null){
      birthday = DateTime.now();
    }else
      {
        birthday = provisoire.toDate();
      }
    String? provisoireAvatar = map["AVATAR"];
    if(provisoireAvatar == null){
        avatar = defaultImage;
    }
    else
      {
        avatar = provisoireAvatar;
      }
  }

//méthode
}