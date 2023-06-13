
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstappesin/model/my_user.dart';

class FirestoreHelper{
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final cloudUsers= FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloudMessages = FirebaseFirestore.instance.collection("MESSAGES");

  //méthode inscription
  Future<MyUser> inscription(String prenom , String nom , String email , String password) async {
    UserCredential resultat = await auth.createUserWithEmailAndPassword(email: email, password: password);
    String uid =resultat.user!.uid;
    Map<String,dynamic> data = {
      "PRENOM":prenom,
      "NOM":nom,
      "PSEUDO":"",
      "EMAIL":email

    };
    addUser(uid, data);
    return getUser(uid);
  }

  //
  Future<MyUser> getUser(String uid) async {
    DocumentSnapshot snapshot = await cloudUsers.doc(uid).get();
    return MyUser.database(snapshot);
  }


  //méthode connexion
  Future<MyUser> connect(String email, String password) async{
    UserCredential resultat = await auth.signInWithEmailAndPassword(email: email, password: password);
    String uid = resultat.user!.uid;
    return getUser(uid);
  }


  //methode mise à jour utilisateur
  updateUser(String uid , Map<String,dynamic>data){
    cloudUsers.doc(uid).update(data);

  }

  //suppression utilisateur

  //creation utilisateur
 addUser(String uid , Map<String,dynamic>data){
    cloudUsers.doc(uid).set(data);

 }


}