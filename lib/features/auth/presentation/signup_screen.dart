import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common_widgets/custom_text_field.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../gen/assets.gen.dart';
import 'widgets/auth_back_button.dart';
import 'widgets/do_you_have.dart';

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthBackButton(),
              SizedBox(height: 24.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Enter Your Personal Information',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),

                    CustomTextField(
                      controller: _nameController,
                      upperTitle: 'UserName',
                      hintText: 'Your Full Name',
                      keyboardType: TextInputType.name,
                      // Add a validator if needed
                    ),

                    SizedBox(height: 16.h),

                    CustomTextField(
                      controller: _emailController,
                      upperTitle: 'Email',
                      hintText: 'Your Email Address',
                      keyboardType: TextInputType.emailAddress,
                      // Add email validation
                    ),

                    SizedBox(height: 16.h),

                    CustomTextField(
                      hintText: 'Your password',
                      upperTitle: 'Password',
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      isPassword: true,
                      toggleVisible: true,
                      suffixIconPath:
                          _isPasswordVisible
                              ? Assets.icons.eyeShow.path
                              : Assets.icons.eyeHide.path,
                      onSuffixIconPressed: () {
                        setState(
                          () => _isPasswordVisible = !_isPasswordVisible,
                        );
                      },
                    ),

                    SizedBox(height: 16.h),

                    CustomTextField(
                      hintText: 'Confirm Your password',
                      upperTitle: 'Confirm Password',
                      controller: _confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      isPassword: true,
                      toggleVisible: true,
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

              SizedBox(height: 16.h),

              CustomButton(onPressed: () {}, text: 'Sign Up'),
              SizedBox(height: 24.h),
              const DoYouHave(hasAccount: true),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
