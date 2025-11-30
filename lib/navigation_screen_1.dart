import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/gen/assets.gen.dart';

import 'gen/colors.gen.dart';
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
      // const HomeScreenDeliveryman(),
      // const HistoryScreenDeliveryman(),
      // const EarningsScreen(),
      // const ProfileScreen(),
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

        bottomNavigationBar: NavBarAllItems(
          currentIndex: activeIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

// ------------------- NAV BAR ITEMS WIDGET ------------------ //

class NavBarAllItems extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  NavBarAllItems({
    required this.currentIndex,
    required this.onItemTapped,
    super.key,
  });
  final List<Map<String, String>> navItems = [
    {'label': 'Home', 'iconPath': Assets.icons.bell.path},
    {'label': 'Scan', 'iconPath': Assets.icons.camera.path},
    {'label': 'History', 'iconPath': Assets.icons.call.path},
    {'label': 'Profile', 'iconPath': Assets.icons.profile.path},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.c252A32,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1.h,
            width: double.infinity,
            color: AppColors.cFFFFFF.withValues(alpha: .7),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(navItems.length, (index) {
                final item = navItems[index];
                final isSelected = index == currentIndex;
                return InkWell(
                  onTap: () => onItemTapped(index),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: Image.asset(
                      item['iconPath']!,
                      color:
                          isSelected
                              ? AppColors.allPrimaryColor
                              : AppColors.cFFFFFF,
                      height: 38.h,
                      width: 38.w,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
