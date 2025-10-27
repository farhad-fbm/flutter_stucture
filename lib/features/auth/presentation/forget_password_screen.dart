import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/text_font_style.dart';

import '../../../../../constants/validator.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpace(32.h),
            InkWell(
              onTap: () => NavigationService.goBack,
              child: Image.asset(
                Assets.icons.arrowBack.path,
                height: 17.h,
                width: 10.w,
                // color: AppColors.c212121,
              ),
            ),
            UIHelper.verticalSpace(24.h),

            // Title
            Text(
              'Enter E-mail Address',
              style: TextFontStyle.textStyle13c071431Poppins700.copyWith(
                fontFamily: 'Roboto_Bold',
              ),
              textAlign: TextAlign.center,
            ),

            UIHelper.verticalSpace(16.h),

            CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              validator: emailValidator,
            ),

            UIHelper.verticalSpace(8.h),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                // NavigationService.navigateTo(Routes.otpScreen);
              },
              borderRadius: 0.r,
            ),
            // SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 24.h),
          ],
        ),
      ),
    );
  }
}
