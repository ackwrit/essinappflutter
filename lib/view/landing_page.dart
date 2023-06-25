import 'package:dots_indicator/dots_indicator.dart';
import 'package:firstappesin/view/background_view.dart';
import 'package:firstappesin/view/register_page.dart';
import 'package:flutter/material.dart';
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
      extendBodyBehindAppBar: true,

      body: bodyPage(),


    );
  }

  Widget bodyPage(){
    return Stack(
        children: [
          const BackgroundView(),
          Column(
              children: [
                Flexible(
                  child: SizedBox(
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
                          const Text("mon texte")
                        ],
                      ),

                      Column(
                        children: [
                          Lottie.asset("assets/vacation.json"),
                          const Text("mon texte")
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
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.purple
                        ),
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.purple
                      ),
                        onPressed: (){
                      if(positionDot == 2){
                        //aller sur la nouvelle page
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return RegitserView();
                            }
                        ));
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
        ],

    );



  }
}
