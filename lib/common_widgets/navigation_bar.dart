import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helpers/ui_helpers.dart';

class NavigationBar extends StatefulWidget {
  final int activeIndex;

  const NavigationBar({this.activeIndex = 0, super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.activeIndex;
  }

  void onItemTapped(int index) {
    if (index == currentIndex) return; // prevent reloading same page
    setState(() => currentIndex = index);

    // Navigate to respective screens
    switch (index) {
      case 0:
        // NavigationService.navigateTo(Routes.homeScreen);
        break;
      case 1:
        // NavigationService.navigateTo(Routes.scanHomeScreen);
        break;
      case 2:
        // NavigationService.navigateTo(Routes.historyHome);
        break;
      case 3:
        // NavigationService.navigateTo(Routes.profileHome);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: const Color(0xFF02BC7D),
      height: 110.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 1.h,
            width: double.infinity,
            color: const Color(0xFF000000).withValues(alpha: .7),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(navItems.length, (index) {
                final item = navItems[index];
                final isSelected = currentIndex == index;

                return InkWell(
                  borderRadius: BorderRadius.circular(50.r),
                  onTap: () => onItemTapped(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Image.asset(
                      //   item.iconPath!,
                      //   color:
                      //       isSelected
                      //           ? const Color(0xFF4B9954)
                      //           : const Color(0xFFFFFFFF),
                      //   height: 38.h,
                      //   width: 38.w,
                      // ),
                      Icon(
                        item.iconData,
                        color:
                            isSelected
                                ? const Color(0xFF4B9954)
                                : const Color(0xFFFFFFFF),
                        size: 38.h,
                      ),
                      UIHelper.verticalSpace(16.h),
                    ],
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

// --- Shared Nav Data ---
final List<NavItem> navItems = [
  NavItem(label: 'Home', iconData: Icons.home),
  NavItem(label: 'Scan', iconData: Icons.qr_code_scanner),
  NavItem(label: 'History', iconData: Icons.history),
  NavItem(label: 'Profile', iconData: Icons.person),
];

class NavItem {
  final String label;
  final String? iconPath;
  final IconData? iconData;
  const NavItem({required this.label, this.iconPath, this.iconData});
}
