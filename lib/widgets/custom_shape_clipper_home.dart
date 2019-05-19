import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height-40);
    var firstEndPoint = Offset(size.width/1.8, size.height-40.0);
    var firstControlPoint = Offset(size.width/3.7, size.height+40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height-80);
    var secondControlPoint = Offset(size.width*0.80, size.height-10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {

    return true;
  }

}