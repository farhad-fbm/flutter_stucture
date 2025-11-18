import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';

class DoYouHave extends StatelessWidget {
  final bool hasAccount;
  const DoYouHave({super.key, required this.hasAccount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          hasAccount ? 'Already have an account? ' : 'Don\'t have an account? ',
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(width: 4.w),
        GestureDetector( 
          onTap: () {
            if (hasAccount) {
              NavigationService.navigateTo(Routes.signInScreen);
              return;
            }
            NavigationService.navigateTo(Routes.signUpScreen);
          },
          child: Text(
            hasAccount ? 'Sign In' : 'Sign Up',
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff4B9954),
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}
