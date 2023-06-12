import 'dart:async';

import 'package:firstappesin/view/custom_view_path.dart';
import 'package:flutter/material.dart';

class BackgroundView extends StatefulWidget {
  const BackgroundView({Key? key}) : super(key: key);

  @override
  State<BackgroundView> createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<Alignment> animationAlign;
  Color colorVariant = Colors.transparent;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 6),

    );
    CurvedAnimation animationCurved = CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInQuad
    );
    animation = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(animationCurved);
    animationAlign = Tween<Alignment>(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).animate(animationCurved);
    Timer(const Duration(seconds: 1),(){
      setState(() {

        animationController.forward();


      });
    });
    animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        setState(() {
          colorVariant = Colors.purpleAccent;
        });
      }
    });









    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child){
        return ClipPath(
          clipper: CustomPath(animation.value),
          child: Container(
            color: Colors.purple,


            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,




          ),

        );
      }

    );
  }
}
