import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/gen/assets.gen.dart';
import 'common_widgets/bottom_nav_bar_item.dart';
import 'gen/colors.gen.dart';
import 'helpers/helper_methods.dart';

class NavigationScreen extends StatefulWidget {
  final Widget? pageNum;
  const NavigationScreen({super.key, this.pageNum});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  final bool _isFisrtBuild = true;
  // bool _navigationOn = true;

  final List<dynamic> _screens = [
    // const HomeScreen(),
    // const DocumentsScreen(),
    // const NotificationScreen(),
    // const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? args;
    StatelessWidget? screenPage;
    if (_isFisrtBuild) {
      args = ModalRoute.of(context)!.settings.arguments;
    }
    if (args != null) {
      screenPage = args as StatelessWidget;
      var newColorindex = -1;

      for (var element in _screens) {
        newColorindex++;
        if (element.toString() == screenPage.toString()) {
          _currentIndex = newColorindex;
          break;
        }
      }
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) async {
        showMaterialDialog(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: Center(
          child:
              (screenPage != null)
                  ? screenPage
                  : _screens.elementAt(_currentIndex),
        ),
        bottomNavigationBar: Container(
          height: 100.h,
          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                enableFeedback: false,
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                child:
                    _currentIndex == 0
                        ? BottomNavBarItem(
                          image: Assets.icons.home.path,
                          title: 'Home',
                          isActive: true,
                        ).buildWidget()
                        : BottomNavBarItem(
                          image: Assets.icons.home.path,
                          title: 'Home',
                          isActive: false,
                        ).buildWidget(),
              ),
              InkWell(
                enableFeedback: false,
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                child:
                    _currentIndex == 1
                        ? BottomNavBarItem(
                          image: Assets.icons.document.path,
                          title: 'Documentes',
                          isActive: true,
                        ).buildWidget()
                        : BottomNavBarItem(
                          image: Assets.icons.document.path,
                          title: 'Documentes',
                          isActive: false,
                        ).buildWidget(),
              ),
              InkWell(
                enableFeedback: false,
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                child:
                    _currentIndex == 2
                        ? BottomNavBarItem(
                          image: Assets.icons.notification.path,
                          title: 'Notification',
                          isActive: true,
                        ).buildWidget()
                        : BottomNavBarItem(
                          image: Assets.icons.notification.path,
                          title: 'Notification',
                          isActive: false,
                        ).buildWidget(),
              ),
              InkWell(
                enableFeedback: false,
                onTap: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
                child:
                    _currentIndex == 3
                        ? BottomNavBarItem(
                          image: Assets.icons.profile.path,
                          title: 'Account',
                          isActive: true,
                        ).buildWidget()
                        : BottomNavBarItem(
                          image: Assets.icons.profile.path,
                          title: 'Account',
                          isActive: false,
                        ).buildWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
