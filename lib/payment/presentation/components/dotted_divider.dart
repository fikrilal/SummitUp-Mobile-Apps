import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedDivider extends StatelessWidget {
  final double thickness;
  final Color color;

  const DottedDivider({
    Key? key,
    this.thickness = 1.0,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedLinePainter(thickness: thickness, color: color),
      child: SizedBox(
        height: thickness,
        width: double.infinity,
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final double thickness;
  final Color color;

  _DottedLinePainter({required this.thickness, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;

    const dashWidth = 5.0;
    const dashSpace = 5.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
