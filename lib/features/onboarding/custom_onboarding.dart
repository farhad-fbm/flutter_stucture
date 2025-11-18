import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": Assets.images.onboarding1.path,
      "title": "Scan Any Key Instantly",
      "subtitle":
          "Use your mobile camera to detect key type and pattern in seconds.",
    },
    {
      "image": Assets.images.onboarding2.path,
      "title": "Get Accurate Key Codes",
      "subtitle":
          "AI identifies manufacturer and key code with precise bitting details.",
    },
    {
      "image": Assets.images.onboarding3.path,
      "title": "Save & Manage Your History",
      "subtitle":
          "Keep all your scanned keys organized, documented, and ready anytime.",
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
      // NavigationService.navigateTo(Routes.authHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final data =
        (_currentPage >= 0 && _currentPage < onboardingData.length)
            ? onboardingData[_currentPage]
            : onboardingData.first;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final image = onboardingData[index]["image"]!;
                return Align(
                  alignment: Alignment.topCenter,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (child, animation) => FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.1, 0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: SizedBox(
                        key: ValueKey<String>(image),
                        height: height * 0.65,
                        width: double.infinity,
                        child: Image.asset(image, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                );
              },
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 2.h,
                    child: Container(color: const Color(0xFF828282)),
                  ),
                  Container(
                    width: double.infinity,
                    height: height * 0.38,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 28.h,
                    ),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            onboardingData.length,
                            (i) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 8,
                              width: _currentPage == i ? 24 : 8,
                              decoration: BoxDecoration(
                                color:
                                    _currentPage == i
                                        ? const Color(0xFFF4D915)
                                        : const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 24.h),

                        _buildAnimatedText(
                          data["title"]!,
                          const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFEFEFE),
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                        SizedBox(height: 12.h),
                        _buildAnimatedText(
                          data["subtitle"]!,
                          const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF6F8FE8),
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),

                        const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                // () => NavigationService.navigateTo(
                                //   Routes.authHome,
                                // ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFFBE0),
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                ),
                                child: const Text(
                                  "Skip",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF171725),
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 24.w),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _nextPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF4D915),
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                ),
                                child: Text(
                                  _currentPage == onboardingData.length - 1
                                      ? "Get Started"
                                      : "Continue",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF171725),
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAnimatedText(String text, TextStyle style) {
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
    child: Text(text, key: ValueKey<String>(text), style: style),
  );
}
