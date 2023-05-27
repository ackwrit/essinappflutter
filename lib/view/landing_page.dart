import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class LandinPageView extends StatefulWidget {
  const LandinPageView({Key? key}) : super(key: key);

  @override
  State<LandinPageView> createState() => _LandinPageViewState();
}

class _LandinPageViewState extends State<LandinPageView> {
  PageController pageController = PageController();
  int positionDot = 0;





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        elevation: 0,
      ),
      body: bodyPage(),

    );
  }

  Widget bodyPage(){
    return SafeArea(
      bottom: true,
      child: Column(
          children: [
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height*0.85,
                child: PageView(
                controller: pageController,
                onPageChanged: (value){
                  setState(() {
                    positionDot = value;
                  });


                },
                children: [
                  Column(
                    children: [
                      Lottie.asset("assets/globe.json"),
                      Text("mon texte")
                    ],
                  ),

                  Column(
                    children: [
                      Lottie.asset("assets/relax.json"),
                      Text("mon texte")
                    ],
                  ),

                  Column(
                    children: [
                      Lottie.asset("assets/vacation.json"),
                      Text("mon texte")
                    ],
                  ),

                ],

      ),
              ),
            ),

            //mes booutons et mon dot
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if(positionDot == 0){
                          positionDot =0;
                        }
                        else
                          {
                            positionDot --;

                            pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
                          }

                      });
                    },
                    child: const Text("Précèdent")
                ),
                DotsIndicator(
                  position: positionDot,
                    dotsCount: 3,

                ),
                ElevatedButton(onPressed: (){
                  if(positionDot == 2){
                    //aller sur la nouvelle page
                  }
                  else {
                    setState(() {
                      positionDot ++;
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    });
                  }


                }, child: const Text("Suivant")
                ),
              ],
            )

          ],
        ),
    );



  }
}
