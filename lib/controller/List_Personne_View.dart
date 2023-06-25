import 'package:flutter/material.dart';

class ListViewPerson extends StatefulWidget {
  const ListViewPerson({Key? key}) : super(key: key);

  @override
  State<ListViewPerson> createState() => _ListViewPersonState();
}

class _ListViewPersonState extends State<ListViewPerson> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child:  Center(child: Text("Afficher toutes les personnes")));
  }
}
