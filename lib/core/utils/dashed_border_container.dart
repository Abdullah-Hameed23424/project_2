import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  final Color color;
  final double strokeWidth;
  final EdgeInsetsGeometry padding;

  const DashedBorderContainer({
    super.key,
    required this.child,
    this.radius = 8.0,
    this.color = Colors.grey,
    this.strokeWidth = 1.5,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        color: color,
        radius: radius,
        strokeWidth: strokeWidth,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double radius;
  final double strokeWidth;

  DashedBorderPainter({
    required this.color,
    required this.radius,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ),);

    const dashWidth = 8;
    const dashSpace = 8;
    double distance = 0.0;

    final PathMetric pathMetric = path.computeMetrics().first;
    while (distance < pathMetric.length) {
      final Path extractPath = pathMetric.extractPath(
        distance,
        distance + dashWidth,
      );
      canvas.drawPath(extractPath, paint);
      distance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
