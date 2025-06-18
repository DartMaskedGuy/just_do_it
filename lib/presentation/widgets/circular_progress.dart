import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final double progress;

  const CircularProgress({super.key, required this.progress});

  Color _getProgressColor(double value) {
    if (value < 0.25) return Colors.red;
    if (value < 0.50) return Colors.orange;
    if (value < 0.75) return Colors.yellow;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final progressColor = _getProgressColor(progress);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 55,
          width: 55,
          child: CircularProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            strokeWidth: 4,
          ),
        ),
        Text(
          '${(progress * 100).toInt()}%',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: progressColor,
          ),
        ),
      ],
    );
  }
}
