import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final onboardingData = [
    {
      "image": Assets.images.onboarding1.path,
      "title": "Fresh Food",
      "subtitle":
          "Discover a variety of fresh groceries delivered straight to your door.",
    },
    {
      "image": Assets.images.onboarding2.path,
      "title": "Fast Delivery",
      "subtitle": "Get your groceries delivered with our speedy service.",
    },
    {
      "image": Assets.images.onboarding3.path,
      "title": "Easy Payment",
      "subtitle":
          "Choose from multiple payment options for a seamless checkout experience.",
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      debugPrint("Onboarding Completed");
      NavigationService.navigateTo(Routes.authHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = onboardingData[_currentPage];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// ----------------- TOP PAGEVIEW -----------------
            Expanded(
              child: Stack(
                children: [
                  // PAGEVIEW
                  PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingData.length,
                    onPageChanged: (i) => setState(() => _currentPage = i),
                    itemBuilder: (_, index) {
                      final image = onboardingData[index]["image"]!;
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          key: ValueKey(image),
                          padding: EdgeInsets.only(top: 24.h),
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            image,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),

                  // SKIP BUTTON
                  Positioned(
                    top: 24.h, // adjust with ScreenUtil
                    right: 16.w,
                    child: GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(Routes.authHome);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFF4B9954),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ----------------- BOTTOM CONTENT -----------------
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildAnimatedText(
                    Text(
                      data["title"]!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF4B9954),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _buildAnimatedText(
                    Text(
                      data["subtitle"]!,
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xFF000000).withValues(alpha: 0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  /// DOT INDICATOR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == i ? 8 : 8,
                        decoration: BoxDecoration(
                          color:
                              _currentPage == i
                                  ? const Color(0xFF4B9954)
                                  : const Color(
                                    0xFF4B9954,
                                  ).withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 120.h),

                  /// BUTTONS
                  CustomButton(
                    text:
                        _currentPage == onboardingData.length - 1
                            ? "Get Started"
                            : "Next",
                    onPressed: _nextPage,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAnimatedText(Widget textWidget) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 50),
    switchInCurve: Curves.easeIn,
    switchOutCurve: Curves.easeOut,
    transitionBuilder: (child, animation) {
      Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 1),
      ).animate(animation);

      return FadeTransition(opacity: animation, child: child);
    },
    layoutBuilder:
        (currentChild, previousChildren) => Stack(
          alignment: Alignment.centerLeft,
          children: [
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        ),
    child: textWidget,
  );
}
