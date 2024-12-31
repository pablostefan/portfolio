import 'dart:math';

import 'package:flutter/material.dart';

class RandomDottedBorder extends StatelessWidget {
  final double radius;
  final Color color;
  final double strokeWidth;

  const RandomDottedBorder({
    super.key,
    this.radius = 100.0,
    this.color = Colors.green,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(radius * 2, radius * 2),
        painter: RandomDottedBorderPainter(
          radius: radius,
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class RandomDottedBorderPainter extends CustomPainter {
  final double radius;
  final Color color;
  final double strokeWidth;

  RandomDottedBorderPainter({
    required this.radius,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final random = Random();

    const int totalSegments = 40; // Número total de segmentos (pontilhados)
    double startAngle = 0;

    for (int i = 0; i < totalSegments; i++) {
      // Comprimento randômico de cada segmento
      final double segmentLength = random.nextDouble() * 15 + 5; // Entre 5 e 20
      // Espaçamento randômico entre os segmentos
      final double gapLength = random.nextDouble() * 10 + 5; // Entre 5 e 15

      // Calcula o ângulo em radianos para o comprimento do segmento
      final double segmentAngle = (segmentLength / (2 * pi * radius)) * 360;
      final double gapAngle = (gapLength / (2 * pi * radius)) * 360;

      // Desenha o segmento
      final double endAngle = startAngle + segmentAngle;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        _degreesToRadians(startAngle),
        _degreesToRadians(segmentAngle),
        false,
        paint,
      );

      // Atualiza o ângulo inicial para o próximo segmento
      startAngle = endAngle + gapAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Permite repaint para comportamento randômico
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}
