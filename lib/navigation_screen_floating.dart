


// --------------------- Shared NavBarItems Widget --------------------
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gen/assets.gen.dart';

class CustomFloatingNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  CustomFloatingNavBar({
    required this.currentIndex,
    required this.onItemTapped,
    super.key,
  });
  // --- Shared Nav Data ---
  final List<Map<String, String>> navItems = [
    {'label': 'Home', 'iconPath': Assets.icons.bell.path},
    {'label': 'Scan', 'iconPath': Assets.icons.camera.path},
    {'label': 'History', 'iconPath': Assets.icons.call.path},
    {'label': 'Profile', 'iconPath': Assets.icons.profile.path},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: double.infinity,
      // padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .3),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GestureDetector(
              onTap: () => onItemTapped(index),
              child: NavBarItem(
                iconPath: item['iconPath']!,
                title: item['label']!,
                isActive: currentIndex == index,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isActive;

  const NavBarItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isActive
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF4B9954),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      iconPath,
                      color: const Color(0xFFFFFFFF),
                      height: 30.h,
                      width: 30.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                child: Image.asset(
                  iconPath,
                  color: const Color(0xFF000000),
                  height: 30.h,
                  width: 30.h,
                ),
              ),
      ],
    );
  }
}
