import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationBarFloating extends StatefulWidget {
  final int activeIndex;

  const NavigationBarFloating({this.activeIndex = 0, super.key});

  @override
  State<NavigationBarFloating> createState() => _NavigationBarFloatingState();
}

class _NavigationBarFloatingState extends State<NavigationBarFloating> {
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
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .2),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),

      height: 64.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          final isSelected = currentIndex == index;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: InkWell(
              onTap: () => onItemTapped(index),
              borderRadius: BorderRadius.circular(50.r),
              child:
                  isSelected
                      ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4B9954),
                          borderRadius: BorderRadius.circular(50.r),
                        ),

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              item.iconData,
                              color: const Color(0xFFFFFFFF),
                              size: 30.h,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              item.label,
                              style: TextStyle(
                                color: const Color(0xFFFFFFFF),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                      : Icon(
                        item.iconData,
                        color: const Color(0xFF000000),
                        size: 30.h,
                      ),
            ),
          );
        }),
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
