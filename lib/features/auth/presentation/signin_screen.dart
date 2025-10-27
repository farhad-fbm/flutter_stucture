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

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  // bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              'Welcome Back!',
              style: TextFontStyle.textStyle32c212121Poppins700,

              // textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(8.h),
            Text(
              'Log in to continue detecting and managing \nyour keys',
              style: TextFontStyle.textStyle18c071431Poppins400,
              textAlign: TextAlign.center,
            ),

            UIHelper.verticalSpace(180.h),

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),

                  UIHelper.verticalSpace(24.h),

                  CustomTextField(
                    hintText: 'Enter your password',
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

                  InkWell(
                    onTap: () {
                      // NavigationService.navigateTo(Routes.forgetPasswordScreen);
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password',
                        style: TextFontStyle.textStyle14c0184FFPoppins500,
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(24.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You don\'t have an account? ',
                        style:
                            TextFontStyle.textStyle18c071431Poppins400,
                      ),
                      UIHelper.horizontalSpace(8.w),
                      GestureDetector(
                        onTap: () {
                          // NavigationService.navigateTo(Routes.signInScreen);
                        },
                        child: Text(
                          'Sign Up',
                          style:
                              TextFontStyle
                                  .textStyle18c071431Poppins700,
                        ),
                      ),
                    ],
                  ),

                  UIHelper.verticalSpace(24.h),
                  CustomButton(
                    text: 'Log In',
                    onPressed: () {
                     
                      // NavigationService.navigateTo(Routes.homeScreen);
                    },
                  ),
                  UIHelper.verticalSpace(24.h),
                  OrDivider(color: AppColors.cFFFFFF),
                  UIHelper.verticalSpace(24.h),
                  CustomButton(
                    onPressed: () {},
                    text: 'Continue with Google',
                    icon: Assets.icons.google.path,
                    bgColor: AppColors.cFFFFFF,
                  ),
                  UIHelper.verticalSpace(40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
