
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/text_font_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import '../../../common_widgets/custom_button.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.icons.logo.path, height: 50.h, width: 200.w),
                UIHelper.verticalSpace(24.h),
                Text(
                  "Let's Get Started",
                  style: TextFontStyle.textStyle32c212121Poppins700,
                ),
                UIHelper.verticalSpace(8.h),
                Text(
                  "Let's dive into your account",
                  style:
                      TextFontStyle.textStyle18c071431Poppins700,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 1.h,
            child: Container(color: AppColors.c828282),
          ),
          UIHelper.verticalSpace(48.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                CustomButton(
                  icon: Assets.icons.google.path,
                  text: 'Continue with Google',
                  onPressed: () {},
                  bgColor: AppColors.cFFFFFF,
                ),
                UIHelper.verticalSpace(24.h),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    // NavigationService.navigateTo(Routes.signupLandingScreen);
                  },
                ),
                UIHelper.verticalSpace(24.h),
                CustomButton(
                  text: 'Log In',
                  onPressed: () {
                    // NavigationService.navigateTo(Routes.signInScreen);
                  },
                  bgColor: AppColors.cFFFFFF,
                ),

                UIHelper.verticalSpace(24.h),
                Text(
                  'Privacy Policy . Terms of Service',
                  style: TextFontStyle.textStyle14c0184FFPoppins500,
                ),
                // UIHelper.verticalSpace(48.h),
              ],
            ),
          ),
        ],
      ),
     
    );
  }
}
