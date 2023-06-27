import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstappesin/controller/firestoreHelper.dart';
import 'package:firstappesin/globale.dart';
import 'package:firstappesin/model/my_user.dart';
import 'package:firstappesin/view/my_custom_view_card.dart';
import 'package:flutter/material.dart';

class ListViewPerson extends StatefulWidget {
  const ListViewPerson({Key? key}) : super(key: key);

  @override
  State<ListViewPerson> createState() => _ListViewPersonState();
}

class _ListViewPersonState extends State<ListViewPerson> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirestoreHelper().cloudUsers.snapshots(),
            builder: (context,snap){
              List? documents = snap.data?.docs;
              if(documents == null){
                return const Center(
                    child: Text("Aucune information ...")
                );
              }
              else
                {
                  return ListView.builder(
                    itemCount: documents.length,
                   itemBuilder: (context,index){
                      MyUser lesAutres = MyUser.database(documents[index]);
                      if(lesAutres.uid == moi.uid){
                        return const SizedBox();
                      }
                      else
                        {
                          return MyCustomCardView(utilisateur: lesAutres);
                        }

                   },
                  );
                }
            }
        )
    );
  }
}
