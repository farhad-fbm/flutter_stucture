import 'package:flutter/material.dart';

class CustomDottedLine extends StatelessWidget {
  final double height;
  final Color color;

  const CustomDottedLine({this.height = 1, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 4.0;
        final dashSpace = 2.0;
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return Container(width: dashWidth, height: height, color: color);
          }),
        );
      },
    );
  }
}
