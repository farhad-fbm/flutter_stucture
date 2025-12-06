import 'package:flutter/material.dart';
import '../../helpers/navigation_service.dart';
import '../../helpers/all_routes.dart';
import '../navigation_screen_animated.dart';

class CustomNavigationBarAnimated extends StatelessWidget {
  final int? activeIndex;

  const CustomNavigationBarAnimated({this.activeIndex = 0, super.key});
  void onItemTapped(int index) {
    NavigationService.popAndReplaceWithArgs(Routes.navigationScreen, {
      'index': index,
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomCurvedNavBar(
      currentIndex: activeIndex!,
      onItemTapped: onItemTapped,
    );
  }
}
