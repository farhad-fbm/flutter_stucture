import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/gen/assets.gen.dart';
import 'helpers/helper_methods.dart';

// ignore: must_be_immutable
class NavigationScreen extends StatefulWidget {
  final int? initialIndex;
  const NavigationScreen({super.key, this.initialIndex});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int _currentIndex;
  bool search = false;
  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    _screens = [
      // const HomeScreen(),
      // const HistoryScreen(),
      // const CartScreen(),
      // const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) async {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
          return;
        }
        final shouldExit = await showExitDialog(context);
        if (shouldExit == true) {
          SystemNavigator.pop();
        }
      }, 
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Container(
          height: 64.h,
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
            children: [
              ...List.generate(navItems.length, (index) {
                final item = navItems[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: InkWell(
                    enableFeedback: false,
                    borderRadius: BorderRadius.circular(50.r),
                    onTap: () => _onItemTapped(index),
                    child:
                        BottomNavBarItem(
                          iconPath: item['iconPath']!,
                          title: item['label']!,
                          isActive: _currentIndex == index,
                        ).buildWidget(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBarItem {
  String title;
  String iconPath;
  bool isActive;

  BottomNavBarItem({
    required this.title,
    required this.iconPath,
    required this.isActive,
  });

  Widget buildWidget() {
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

// --- Shared Nav Data ---
final List<Map<String, String>> navItems = [
  // {'label': 'Home', 'iconPath': Assets.icons..path},
  // {'label': 'History', 'iconPath': Assets.icons.history.path},
  // {'label': 'Earnings ', 'iconPath': Assets.icons.earning.path},
  {'label': 'Profile', 'iconPath': Assets.icons.profile.path},
];
