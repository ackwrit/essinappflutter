import 'package:firstappesin/view/background_view.dart';
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
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const BackgroundView(),
          SafeArea(child: bodyPage()),
        ],
      ),
    );
  }

  Widget bodyPage(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(

            decoration: InputDecoration(
              hintText: "Entrer votre nom",


              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(15),
              )
            ),
          ),
          const SizedBox(height: 10,),

          TextField(
            decoration: InputDecoration(
                hintText: "Entrer votre prénom",

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15),
                )
            ),
          ),
          const SizedBox(height: 10,),


          TextField(
            decoration: InputDecoration(
                hintText: "Entrer votre mail",

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15),
                )
            ),
          ),
          const SizedBox(height: 10),


          TextField(
            decoration: InputDecoration(
                hintText: "Entrer votre password",

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15),
                )
            ),
          ),
          const SizedBox(height: 10,),

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
      ),
    );
  }
}
