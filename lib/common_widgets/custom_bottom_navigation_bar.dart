import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../gen/colors.gen.dart';
import '../../helpers/ui_helpers.dart';
import '../../gen/assets.gen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int activeIndex;

  const CustomBottomNavigationBar({this.activeIndex = 0, super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
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
      color: AppColors.c02BC7D,
      height: 110.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 1.h,
            width: double.infinity,
            color: AppColors.cFFFFFF.withValues(alpha: .7),
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
                      Image.asset(
                        item.icon,
                        color:
                            isSelected
                                ? AppColors.allPrimaryColor
                                : AppColors.cFFFFFF,
                        height: 38.h,
                        width: 38.w,
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
  NavItem(label: 'Home', icon: Assets.icons.home.path),
  NavItem(label: 'Scan', icon: Assets.icons.apple.path),
  NavItem(label: 'History', icon: Assets.icons.email.path),
  NavItem(label: 'Profile', icon: Assets.icons.profile.path),
];

class NavItem {
  final String label;
  final String icon;
  const NavItem({required this.label, required this.icon});
}
