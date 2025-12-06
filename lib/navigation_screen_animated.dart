

// ------------------------------------------------------------
// CURVED BOTTOM BAR (WITH ANIMATION ADDED)
// ------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gen/assets.gen.dart';

class CustomCurvedNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomCurvedNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  CustomCurvedNavBarState createState() => CustomCurvedNavBarState();
}

class CustomCurvedNavBarState extends State<CustomCurvedNavBar>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double animatedIndex = 0;
  int previousIndex = 0;

  @override
  bool get wantKeepAlive => true; // 🔥 keep state alive

  @override
  void initState() {
    super.initState();
    animatedIndex = widget.currentIndex.toDouble();
    previousIndex = widget.currentIndex;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void didUpdateWidget(covariant CustomCurvedNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentIndex != widget.currentIndex) {
      previousIndex = animatedIndex.floor();

      _animation =
          Tween<double>(
              begin: previousIndex.toDouble(),
              end: widget.currentIndex.toDouble(),
            ).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Curves.easeInOutCubic,
              ),
            )
            ..addListener(() {
              setState(() {
                animatedIndex = _animation.value;
              });
            });

      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double height = 80;

    final List<Map<String, String>> navItems = [
      {'label': 'Home', 'iconPath': Assets.icons.bell.path},
      {'label': 'Scan', 'iconPath': Assets.icons.camera.path},
      {'label': 'History', 'iconPath': Assets.icons.call.path},
      {'label': 'Profile', 'iconPath': Assets.icons.profile.path},
    ];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // BACKGROUND CURVE
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            painter: NavBarPainter(animatedIndex),
            child: Container(height: height),
          ),
        ),

        // ICONS
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(navItems.length, (index) {
                bool isActive = index == widget.currentIndex;

                return GestureDetector(
                  onTap: () => widget.onItemTapped(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: isActive ? 10.h : 0.h,
                      left: 16.w,
                      right: 16.w,
                    ),

                    child: Image.asset(
                      navItems[index]['iconPath']!,
                      color: isActive ? Colors.blue : Colors.white,
                      height: isActive ? 38.h : 30.h,
                      width: isActive ? 38.w : 30.w,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// PAINTER
// ------------------------------------------------------------

class NavBarPainter extends CustomPainter {
  final double animatedIndex;
  NavBarPainter(this.animatedIndex);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF252A32)
      ..style = PaintingStyle.fill;

    final path = Path();

    double width = size.width / 4;
    double curveHeight = 10;
    double center = width * animatedIndex + width / 2;

    // Straight → curve start
    path.moveTo(0, 0);
    path.lineTo(center - 30, 0);

    // Custom polished curve
    path.quadraticBezierTo(center - 22, 0, center - 10, curveHeight);
    path.quadraticBezierTo(center, curveHeight + 12, center + 10, curveHeight);
    path.quadraticBezierTo(center + 18, 0, center + 30, 0);

    // Close shape
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Dot indicator
    final dotPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(center, 4), 6, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
