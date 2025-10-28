import 'package:flutter/material.dart';

class CustomDottedImageLine extends StatelessWidget {
  final String imagePath;
  final double itemHeight;
  final double itemWidth;
  final Color? color;
  final double gap;

  const CustomDottedImageLine({
    required this.imagePath,
    this.itemHeight = 4,
    this.itemWidth = 4,
    this.color,
    this.gap = 1,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // get finite width (fallback to screen width if unbounded)
        final double availableWidth =
            (constraints.hasBoundedWidth && constraints.maxWidth.isFinite)
                ? constraints.maxWidth
                : MediaQuery.of(context).size.width;

        final usableWidth = availableWidth.clamp(0.0, double.infinity);

        // avoid divide-by-zero
        final double singleItemTotal = (itemWidth + gap).clamp(
          0.1,
          double.infinity,
        );

        final int itemCount =
            usableWidth > 0 ? (usableWidth / singleItemTotal).floor() : 0;

        if (itemCount <= 0) return const SizedBox.shrink();

        final children = List<Widget>.generate(itemCount, (_) {
          return Image.asset(
            imagePath,
            height: itemHeight,
            width: itemWidth,
            color: color,
            fit: BoxFit.contain,
          );
        });

        return SizedBox(
          width: availableWidth,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: gap,
            runSpacing: 0,
            children: children,
          ),
        );
      },
    );
  }
}
