import 'package:firstappesin/globale.dart';
import 'package:firstappesin/view/background_view.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(moi.avatar?? defaultImage),
            ),
            Text(moi.email),
            Text(moi.name),
          ],
        ),
      ),
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list),label: "Personnes"),
          BottomNavigationBarItem(icon: Icon(Icons.map),label: "Carte"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favoris"),
        ],

      ) ,
    );
  }

  Widget bodyPage(){
    return Stack(
      children: [
        BackgroundView(),
        PresentationView(),
      ],
    );
  }

  Widget PresentationView(){
    switch(index){
      case 0 : return Center(child: Text("Personnes"),);
      case 1 : return Center(child: Text("Maps"),);
      case 2 : return Center(child: Text("Favoris"),);
      default: return Center(child: Text("Erreur"),);
    }
  }
}
