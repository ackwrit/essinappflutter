
import 'package:flutter/cupertino.dart';

class CustomPath extends CustomClipper<Path>{
  final double progress;
  CustomPath(this.progress);
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height * 0.33);
    path.cubicTo(size.width *0.33, size.height*0.2, size.width*0.66, size.height *0.25, size.width, size.height  *0.33);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomPath oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper.progress != progress;
  }

}