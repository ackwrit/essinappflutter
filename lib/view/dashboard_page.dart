import 'package:file_picker/file_picker.dart';
import 'package:firstappesin/controller/Maps_controller.dart';
import 'package:firstappesin/controller/paiment_controller.dart';
import 'package:firstappesin/globale.dart';
import 'package:firstappesin/view/background_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 0;
  String? urlImage;
  String? nameImage;
  Uint8List? bytesImage;

  //fonctions
  popAfficheImage(){
    showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title:const Text("Souhaitez cette image ?"),
            content: Image.memory(bytesImage!),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: const Text("NON")
              ),

              TextButton(
                  onPressed: (){

                  },
                  child: const Text("OUI")
              ),
            ],
          );
        }
    );
  }
  popImage() async {
    FilePickerResult? resultat = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image
    );
    if( resultat != null){
      nameImage = resultat.files.first.name;
      bytesImage = resultat.files.first.bytes;
      popAfficheImage();
    }
  }
  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
           
            children: [
              InkWell(

                onTap: (){
                  //afficher les photos
                  popImage();
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(moi.avatar?? defaultImage),
                ),
              ),
              const SizedBox(height: 10,),
              Flexible(
                child: Container(
                  height: MediaQuery.of(context).size.height *0.8,
                  child: ListView(
                    padding: const EdgeInsets.all(5),
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.mail),
                          Text(moi.email),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(


                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 10,),
                          Text(moi.fullNmane),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    controller.makePayment(amount: '24', currency: 'EUR');
                    Navigator.pop(context);

                  },
                  child: const Text("Paiement")
              )





            ],
          ),
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
      case 1 : return const Center(
        child: MapsController(),
      );
      case 2 : return Center(child: Text("Favoris"),);
      default: return Center(child: Text("Erreur"),);
    }
  }
}
