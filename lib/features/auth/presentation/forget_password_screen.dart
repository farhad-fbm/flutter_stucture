import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import 'widgets/auth_back_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              const AuthBackButton(),
              SizedBox(height: 24.h),
          
              CustomTextField(
                upperTitle: 'Enter E-mail Address',
                hintText: 'Enter Your Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                // validator: emailValidator,
              ),
              SizedBox(height: 8.h),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  NavigationService.navigateTo(Routes.otpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
