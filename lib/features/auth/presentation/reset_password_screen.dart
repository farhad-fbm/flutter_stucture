// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common_widgets/custom_text_field.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import 'widgets/auth_back_button.dart';
import 'widgets/auth_screen_title.dart';

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
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            const AuthBackButton(),
            SizedBox(height: 24.h),

            const AuthScreenTitle(title: 'Reset password'),
            SizedBox(height: 24.h),

            // Form
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    upperTitle: 'New Password',
                    hintText: 'password',
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    // validator: passwordValidator,
                    isPassword: true,
                    toggleVisible: true,
                    // prefixIconPath: '',
                    suffixIconPath:
                        _isPasswordVisible
                            ? Assets.icons.eyeShow.path
                            : Assets.icons.eyeHide.path,
                    onSuffixIconPressed: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                  ),

                  SizedBox(height: 16.h),

                  CustomTextField(
                    upperTitle: 'Confirm New Password',
                    hintText: 'Confirm password',
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    // validator:
                    //     (v) => confirmPasswordValidator(
                    //       v,
                    //       _passwordController.text,
                    //     ),
                    isPassword: true,
                    toggleVisible: true,
                    // prefixIconPath: '',
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

            SizedBox(height: 24.h),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                NavigationService.navigateTo(Routes.authHome);
              },
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
