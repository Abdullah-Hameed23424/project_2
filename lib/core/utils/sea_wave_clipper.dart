import 'package:flutter/material.dart';

class SeaWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 70);

    path.cubicTo(
      size.width * 0.1,
      size.height - 70,
      size.width * 0.3,
      size.height - 50,
      size.width * 0.45,
      size.height - 30,
    );

    path.cubicTo(
      size.width * 0.65,
      size.height,
      size.width * 0.85,
      size.height - 30,
      size.width,
      size.height - 70,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
