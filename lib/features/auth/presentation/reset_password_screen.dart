// ignore_for_file: unused_import

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

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _confirmPasswordController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              'Reset password',
              style: TextFontStyle.textStyle32c212121Poppins700,
            ),

            UIHelper.verticalSpace(16.h),

            // Form
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Password',
                    style: TextFontStyle.textStyle16c0184FFPoppins400,
                  ),
                  UIHelper.verticalSpace(10.h),
                  CustomTextField(
                    hintText: 'password',
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    validator: passwordValidator,
                    isPassword: true,
                    toggleVisible: true,
                    prefixIconPath: Assets.icons.passwordicon.path,
                    suffixIconPath:
                        _isPasswordVisible
                           ? Assets.icons.eyeShow.path
                            : Assets.icons.eyeHide.path,
                    onSuffixIconPressed: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                  ),

                  UIHelper.verticalSpace(16.h),

                  Text(
                    'Confirm New password',
                    style: TextFontStyle.textStyle16c0184FFPoppins700,
                  ),
                  UIHelper.verticalSpace(10.h),
                  CustomTextField(
                    hintText: 'Confirm password',
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    validator:
                        (v) => confirmPasswordValidator(
                          v,
                          _passwordController.text,
                        ),
                    isPassword: true,
                    toggleVisible: true,
                    prefixIconPath: Assets.icons.passwordicon.path,
                    suffixIconPath:
                        _isConfirmPasswordVisible
                            ? Assets.icons.eyeShow.path
                            : Assets.icons.eyeHide.path,
                    onSuffixIconPressed: () {
                      setState(
                        () =>
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible,
                      );
                    },
                  ),
                ],
              ),
            ),

            UIHelper.verticalSpace(24.h),
            CustomButton(text: 'Continue', onPressed: () {}, borderRadius: 0.r),
            UIHelper.verticalSpace(12.h),
          ],
        ),
      ),
    );
  }
}
