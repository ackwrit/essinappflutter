import 'package:firstappesin/controller/firestoreHelper.dart';
import 'package:firstappesin/globale.dart';
import 'package:firstappesin/model/my_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MyCustomCardView extends StatefulWidget {
  MyUser utilisateur;
  MyCustomCardView({Key? key, required this.utilisateur}) : super(key: key);

  @override
  State<MyCustomCardView> createState() => _MyCustomCardViewState();
}

class _MyCustomCardViewState extends State<MyCustomCardView> {
   bool isEmptyFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.amber,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.utilisateur.avatar ?? defaultImage),
        ),
        title: Text(widget.utilisateur.fullNmane),
        subtitle: Text(widget.utilisateur.email),
        trailing: IconButton(
            onPressed: (){
              setState(() {
                isEmptyFavorite = true;
                moi.favoris!.add(widget.utilisateur.uid);
                Map <String,dynamic> map = {
                  "FAVORIS" : moi.favoris
                };

                FirestoreHelper().updateUser(moi.uid, map);
              });
            },
            icon: moi.favoris!.contains(widget.utilisateur.uid)? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border)
        )
      ),
    );
  }
}
