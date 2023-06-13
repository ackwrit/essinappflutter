import 'package:firstappesin/controller/firestoreHelper.dart';
import 'package:firstappesin/controller/my_animation.dart';
import 'package:firstappesin/view/background_view.dart';
import 'package:flutter/material.dart';

class RegitserView extends StatefulWidget {
  const RegitserView({Key? key}) : super(key: key);

  @override
  State<RegitserView> createState() => _RegitserViewState();
}

class _RegitserViewState extends State<RegitserView> {
  //variables
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  bool isRegister = true;
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
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Text("Connexion"),
             Switch.adaptive(
                 value: isRegister,
                 onChanged: (value){
                   setState(() {
                     isRegister = value;
                   });

                 }
             ),
             const Text("Inscription"),
           ],
         ),
          (isRegister)?MyAnimation(
            time: 1,
            child: TextField(
              controller: nom,

              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Entrer votre nom",



                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15),
                )
              ),
            ),
          ):const SizedBox(),
          const SizedBox(height: 10,),

          (isRegister)?MyAnimation(
            time: 2,
            child: TextField(
              controller: prenom,
              decoration: InputDecoration(
                filled: true,
                  fillColor: Colors.white,
                  hintText: "Entrer votre prénom",

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(15),
                  )
              ),
            ),
          ):const SizedBox(),
          const SizedBox(height: 10,),


          MyAnimation(
            time: 3,
            child: TextField(
              controller: mail,
              decoration: InputDecoration(
                  hintText: "Entrer votre mail",
                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(15),
                  )
              ),
            ),
          ),
          const SizedBox(height: 10),


          MyAnimation(
            time: 4,
            child: TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                  hintText: "Entrer votre password",
                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(15),
                  )
              ),
            ),
          ),
          const SizedBox(height: 10,),

          MyAnimation(
            time: 5,
            child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.purple,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
               ),
                onPressed: (){
                  if(isRegister){
                    //je m'inscris
                    FirestoreHelper().inscription(prenom.text, nom.text, mail.text, password.text);
                  }
                  else
                    {
                      //je me connecte

                    }
                },
                child: Text(isRegister?"Inscription":"Connexion")
            ),
          )
        ],
      ),
    );
  }
}
