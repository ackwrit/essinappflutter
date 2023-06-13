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
    return Text("couou");
  }
}
