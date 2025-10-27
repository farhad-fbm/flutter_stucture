// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common_widgets/custom_text_field.dart';
import '../../../../../constants/text_font_style.dart';
import '../../../../../constants/validator.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';

import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/or.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _checkBox = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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

            UIHelper.verticalSpace(48.h),

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpace(8.h),
                  CustomTextField(
                    controller: _nameController,
                    hintText: 'Your Full Name',
                    keyboardType: TextInputType.name,
                    validator: nameValidator,
                  ),

                  UIHelper.verticalSpace(24.h),

                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Your Email Address',
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                    toggleVisible: true,
                  ),

                  UIHelper.verticalSpace(24.h),

                  CustomTextField(
                    hintText: 'Your password',
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    validator: passwordValidator,
                    isPassword: true,
                    toggleVisible: true,
                    // prefixIconPath: Assets.icons.passwordicon.path,
                    suffixIconPath:
                        _isPasswordVisible
                            ? Assets.icons.eyeShow.path
                            : Assets.icons.eyeHide.path,
                    onSuffixIconPressed: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                  ),
                  UIHelper.verticalSpace(24.h),
                  CustomTextField(
                    hintText: 'Confirm Your password',
                    controller: _confirmPasswordController,
                    obscureText: !_isPasswordVisible,
                    validator: passwordValidator,
                    isPassword: true,
                    toggleVisible: true,
                    // prefixIconPath: Assets.icons.passwordicon.path,
                    suffixIconPath:
                        _isPasswordVisible
                            ? Assets.icons.eyeShow.path
                            : Assets.icons.eyeHide.path,
                    onSuffixIconPressed: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                  ),
                ],
              ),
            ),

            UIHelper.verticalSpace(24.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextFontStyle.textStyle18c071431Poppins600,
                ),
                UIHelper.horizontalSpace(8.w),
                GestureDetector(
                  onTap: () {
                    // NavigationService.navigateTo(Routes.signInScreen);
                  },
                  child: Text(
                    'Log In',
                    style: TextFontStyle.textStyle18c071431Poppins600,
                  ),
                ),
              ],
            ),

            UIHelper.verticalSpace(24.h),
            CustomButton(
              text: 'Create Account ',
              onPressed: () {
                
                // NavigationService.navigateTo(Routes.homeScreen);
              },
            ),
            UIHelper.verticalSpace(24.h),
            OrDivider(color: AppColors.cFFFFFF),
            UIHelper.verticalSpace(24.h),
            CustomButton(
              onPressed: () {},
              text: 'Continue  with Google',
              icon: Assets.icons.google.path,
              bgColor: AppColors.cFFFFFF,
            ),
            UIHelper.verticalSpace(40.h),
          ],
        ),
      ),
    );
  }
}
