
import 'package:flutter/cupertino.dart';

class CustomPath extends CustomClipper<Path>{
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
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}