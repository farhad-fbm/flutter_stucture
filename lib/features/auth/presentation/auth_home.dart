import 'package:flutter/material.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              CustomButton(
                text: 'Login',
                onPressed: () {
                  NavigationService.navigateTo(Routes.signInScreen);
                },
              ),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  NavigationService.navigateTo(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
