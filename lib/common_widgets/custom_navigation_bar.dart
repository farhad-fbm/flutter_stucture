import 'package:flutter/material.dart';
import '../../helpers/navigation_service.dart';
import '../../helpers/all_routes.dart';
import '../navigation_screen_1.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int? activeIndex;

  const CustomBottomNavigationBar({this.activeIndex = 0, super.key});

  void onItemTapped(int index) {
    NavigationService.popAndReplaceWithArgs(Routes.navigationScreen, {
      'index': index,
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(currentIndex: activeIndex!, onItemTapped: onItemTapped);
  }
}
