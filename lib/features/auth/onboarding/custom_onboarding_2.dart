import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/ui_helpers.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": Assets.images.onboarding1.path,
      "title": "Welcome to Notebord",
      "subtitle":
          "Your smart voice companion to create notes and reminders effortlessly.",
    },
    {
      "image": Assets.images.onboarding2.path,
      "title": "Capture Ideas with Your Notebord",
      "subtitle":
          "Simply speak, and your thoughts will be turned into notes instantly .",
    },
    {
      "image": Assets.images.onboarding3.path,
      "title": "Never Miss a Task",
      "subtitle":
          "Set reminders quickly using voice commands and stay organized all day .",
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
      backgroundColor: Color(0xFFFDFDFD),
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
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      Assets.images.onboardingBg.path,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: height * 0.38,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 28.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        _buildAnimatedText(
                          data["title"]!,
                          TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF171725),
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                        UIHelper.verticalSpace(16.h),
                        _buildAnimatedText(
                          data["subtitle"]!,
                          TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF6C6C80),
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                        UIHelper.verticalSpace(24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingData.length,
                            (i) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 8,
                              width: _currentPage == i ? 32 : 8,
                              decoration: BoxDecoration(
                                color:
                                    _currentPage == i
                                        ? Color(0xFF96DD00)
                                        : Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        UIHelper.verticalSpace(36.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_currentPage != onboardingData.length - 1)
                              Expanded(
                                child: CustomButton(
                                  text: "Skip All",
                                  onPressed: () {},
                                  bgColor: Color(0xFFF2F5ED),
                                ),
                              ),
                            UIHelper.horizontalSpace(24.w),
                            Expanded(
                              child: CustomButton(
                                text:
                                    _currentPage == onboardingData.length - 1
                                        ? "Open My Notebord"
                                        : "Continue",
                                onPressed: _nextPage,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),
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
