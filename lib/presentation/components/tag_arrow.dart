import 'package:flutter/material.dart';

class TagArrow extends StatelessWidget {
  final String text;
  final Color bgColor, color;
  const TagArrow({
    super.key,
    required this.text,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: CustomPaint(
        painter: ArrowPainter(bgColor: bgColor),
        child: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 25,
            top: 5,
            bottom: 5,
          ),
          child: Text(text, style: TextStyle(color: color, fontSize: 12)),
        ),
      ),
    );
  }
}

class ArrowPainter extends CustomPainter {
  final Color bgColor;
  ArrowPainter({required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = bgColor
          ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - 15, 0); // Before arrow tip
    path.lineTo(size.width, size.height / 2); // Tip of arrow
    path.lineTo(size.width - 15, size.height); // Bottom corner before tip
    path.lineTo(0, size.height); // Bottom left
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
