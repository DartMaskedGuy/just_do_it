import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        radius: 33,
        lineWidth: 4,
        percent: 0.4,
        center: Text(
          "40%",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        progressColor: Colors.green,
        backgroundColor: Colors.green.shade100,
        circularStrokeCap: CircularStrokeCap.round,
        animation: true,
      ),
    );
  }
}
