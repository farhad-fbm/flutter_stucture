import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../features/auth/presentation/auth_home.dart';
import '../features/auth/presentation/forget_password_screen.dart';
import '../features/auth/presentation/otp_screen.dart';
import '../features/auth/presentation/reset_password_screen.dart';
import '../features/auth/presentation/signin_screen.dart';
import '../features/auth/presentation/signup_screen.dart';
import '../features/auth/onboarding/custom_onboarding.dart';
import '../navigation_screen_1.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String onboardingScreen = '/onboardingScreen';
  static const String navigationScreen = '/navigationScreen';
  static const String authHome = '/authHome';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpScreen = '/otpScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //    case Routes.foodDetailsScreen:
      //     final args = (settings.arguments as Map?) ?? {};
      //     Widget screen = FoodDetailsScreen(foodData: args['foodData']);
      //     return Platform.isAndroid
      //         ? _FadedTransitionRoute(widget: screen, settings: settings)
      //         : CupertinoPageRoute(builder: (context) => screen);

      case Routes.navigationScreen:
        Widget screen = const NavigationScreen();
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: screen, settings: settings)
            : CupertinoPageRoute(builder: (context) => screen);
      case Routes.authHome:
        Widget screen = const AuthHome();
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: screen, settings: settings)
            : CupertinoPageRoute(builder: (context) => screen);
      case Routes.signInScreen:
        Widget screen = const SignInScreen();
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: screen, settings: settings)
            : CupertinoPageRoute(builder: (context) => screen);
      case Routes.signUpScreen:
        Widget screen = const SignUpScreen();
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: screen, settings: settings)
            : CupertinoPageRoute(builder: (context) => screen);
      case Routes.forgetPasswordScreen:
        Widget screen = const ForgetPasswordScreen();
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: screen, settings: settings)
            : CupertinoPageRoute(builder: (context) => screen);
      case Routes.otpScreen:
        Widget screen = const OtpScreen();
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: screen, settings: settings)
            : CupertinoPageRoute(builder: (context) => screen);
      case Routes.resetPasswordScreen:
        Widget screen = const ResetPasswordScreen();
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: screen, settings: settings)
            : CupertinoPageRoute(builder: (context) => screen);
      case Routes.onboardingScreen:
        Widget screen = const OnboardingScreen();
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: screen, settings: settings)
            : CupertinoPageRoute(builder: (context) => screen);

      default:
        return null;
    }
  }
}

// ignore: unused_element
class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
    : super(
        settings: settings,
        reverseTransitionDuration: const Duration(milliseconds: 1),
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return widget;
        },
        transitionDuration: const Duration(milliseconds: 1),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.ease),
            child: child,
          );
        },
      );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: widget,
    );
  }
}
