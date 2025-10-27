import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/text_font_style.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/ui_helpers.dart';

class SignupLandingScreen extends StatelessWidget {
  const SignupLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          icon: Image.asset(Assets.icons.arrowBack.path, height: 24, width: 24),
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
            Image.asset(Assets.icons.logo.path, height: 100, width: 200),
            UIHelper.verticalSpace(24.h),
            Text(
              'Create your account',
              style: TextFontStyle.textStyle32c212121Poppins700,

              // textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(8.h),
            Text(
              'Join now to unlock smart key detection and management tools.',
              style: TextFontStyle.textStyle18c071431Poppins400,
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn('User', () {}),
                  UIHelper.horizontalSpace(16.w),
                  btn('Lock Smith', () {}),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                // NavigationService.navigateTo(Routes.signUpScreen);
              },

              borderRadius: 12,
            ),
            UIHelper.verticalSpace(40.h),
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
        backgroundColor: AppColors.cFFFFFF,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextFontStyle.textStyle16c0184FFPoppins600,
      ),
    ),
  );
}
