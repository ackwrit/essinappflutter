import 'package:firstappesin/globale.dart';
import 'package:firstappesin/model/my_user.dart';
import 'package:flutter/material.dart';

class MyCustomCardView extends StatelessWidget {
  MyUser utilisateur;
  MyCustomCardView({Key? key, required this.utilisateur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.amber,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(utilisateur.avatar ?? defaultImage),
        ),
        title: Text(utilisateur.fullNmane),
        subtitle: Text(utilisateur.email),
      ),
    );
  }
}
