import 'dart:math' as math;
import 'package:flutter/material.dart';

class WavyCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final int waveCount;
  final double waveHeight;

  WavyCirclePainter({
    required this.color,
    this.strokeWidth = 3,
    this.waveCount = 12,
    this.waveHeight = 6,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth;

    final center = Offset(size.width / 2, size.height / 2);
    final baseRadius = size.width / 2 - waveHeight;

    final path = Path();

    for (int i = 0; i <= 360; i++) {
      final angle = i * math.pi / 180;
      final wave = math.sin(angle * waveCount) * waveHeight;

      final radius = baseRadius + wave;

      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
