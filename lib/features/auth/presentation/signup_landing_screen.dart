import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common_widgets/custom_button.dart';


class SignupLandingScreen extends StatelessWidget {
  const SignupLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(Icons.arrow_back_ios_new_outlined.toString(), height: 24, width: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Icons.lock.toString(), height: 100, width: 200),
            SizedBox(height: 24.h),
            const Text(
              'Create your account',
              style: TextStyle(
                fontSize: 32,
                color: Color(0xFF212121),
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
              // textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            const Text(
              'Join now to unlock smart key detection and management tools.',
              style: TextStyle(
                fontSize: 18,
                color:  Color(0x0ff71431),
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn('User', () {}),
                  SizedBox(width: 16.w),
                  btn('Lock Smith', () {}),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                // NavigationService.navigateTo(Routes.signUpScreen);
              },

              borderRadius: 12,
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

Widget btn(String title, VoidCallback onPressed) {
  return Expanded(
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          color:  Color(0xFF000000),
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
      ),
    ),
  );
}
