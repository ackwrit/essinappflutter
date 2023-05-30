import 'package:flutter/material.dart';

class RegitserView extends StatefulWidget {
  const RegitserView({Key? key}) : super(key: key);

  @override
  State<RegitserView> createState() => _RegitserViewState();
}

class _RegitserViewState extends State<RegitserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(15),
            )
          ),
        ),

        TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(15),
              )
          ),
        ),


        TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(15),
              )
          ),
        ),


        TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(15),
              )
          ),
        ),
        
        ElevatedButton(
           style: ElevatedButton.styleFrom(
             backgroundColor: Colors.purple,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
           ),
            onPressed: (){
              print("me connecter à la base de donnée");
            }, 
            child: const Text("Inscription")
        )
      ],
    );
  }
}
