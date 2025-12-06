import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/screens/cart_screen.dart';
import 'features/screens/chat_screen.dart';
import 'features/screens/home_screen.dart';
import 'features/screens/settings_screen.dart';
import 'helpers/helper_methods.dart';

class NavigationScreen extends StatefulWidget {
  final int? index;
  const NavigationScreen({super.key, this.index});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int activeIndex;
  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    activeIndex = widget.index ?? 0;
    _screens = [
      const HomeScreen(),
      const CartScreen(),
      const ChatScreen(),
      const SettingsScreen(),
    ];
  }

  void _onItemTapped(int index) async {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (activeIndex != 0) {
          setState(() {
            activeIndex = 0;
          });
          return;
        }
        final shouldExit = await showExitDialog(context);
        if (shouldExit == true) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: _screens[activeIndex],

        bottomNavigationBar: CustomBottomNavBar(
          activeIndex: activeIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

// ------------------- NAV BAR ITEMS WIDGET ------------------ //

class CustomBottomNavBar extends StatelessWidget {
  final int activeIndex;
  final Function(int) onItemTapped;

  CustomBottomNavBar({
    required this.activeIndex,
    required this.onItemTapped,
    super.key,
  });
  final List<Map<String, dynamic>> navItems = [
    {'label': 'Home', 'iconData': Icons.home},
    {'label': 'Scan', 'iconData': Icons.camera},
    {'label': 'History', 'iconData': Icons.history},
    {'label': 'Profile', 'iconData': Icons.person},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF252A32),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          final isActive = index == activeIndex;
          return GestureDetector(
            onTap: () => onItemTapped(index),
            child: AnimatedContainer(
              height: 64,
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: isActive ? 10 : 0,
                left: 16,
                right: 16,
              ),

              child: Icon(
                navItems[index]['iconData'],
                color: isActive ? Colors.blue : Colors.white,
                size: isActive ? 38 : 30,
              ),
            ),
          );
        }),
      ),
    );
  }
}




