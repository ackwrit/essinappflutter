import 'dart:async';

import 'package:flutter/material.dart';


class MyAnimation extends StatefulWidget {
  Widget child;
  int time;
  MyAnimation({Key? key, required this.child, required this.time}) : super(key: key);

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animationOffset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 5000)
    );
    CurvedAnimation curvedAnimation =  CurvedAnimation(parent: _controller, curve: Curves.linear);
    animationOffset = Tween<Offset>(
      begin: const Offset(20,0),
      end: Offset.zero,
    ).animate(curvedAnimation);
    Timer(Duration(milliseconds: widget.time * 500), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _controller,
      child: SlideTransition(
        position: animationOffset,
        child: widget.child,
      ),
    );
  }
}
