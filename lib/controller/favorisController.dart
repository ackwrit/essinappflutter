import 'package:firstappesin/controller/firestoreHelper.dart';
import 'package:firstappesin/globale.dart';
import 'package:firstappesin/model/my_user.dart';
import 'package:flutter/material.dart';

class FavorisController extends StatefulWidget {
  const FavorisController({Key? key}) : super(key: key);

  @override
  State<FavorisController> createState() => _FavorisControllerState();
}

class _FavorisControllerState extends State<FavorisController> {
  List newFavoris = [];

  @override
  void initState() {
    // TODO: implement initState
    for (int i=0;i<moi.favoris!.length;i++){
      FirestoreHelper().getUser(moi.favoris![i]).then((value){
        newFavoris.add(value);
      });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            itemCount: newFavoris.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 2,mainAxisSpacing: 1),
            itemBuilder: (context, index){
              MyUser utilisateur = newFavoris[index];
              return Image.network(utilisateur.avatar ?? defaultImage);
            }
        )
    );
  }
}
