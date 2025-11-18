import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import 'widgets/auth_back_button.dart';
import 'widgets/auth_screen_title.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final int _otpLength = 4;

  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_otpLength, (_) => TextEditingController());
    _focusNodes = List.generate(_otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChangedBox(int index, String value) {
    if (value.length == 1 && index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    setState(() {});
  }

  void _submit() {
    NavigationService.navigateTo(Routes.resetPasswordScreen);
  }

  InputDecoration _otpDecoration(BuildContext context) {
    OutlineInputBorder focusedOutline() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Color(0xFF6A7282), width: 2),
    );
    OutlineInputBorder enableOutline() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    return InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      filled: true,
      fillColor: const Color(0xFFF3F7FF),
      hintText: '-',
      counterText: '',
      enabledBorder: enableOutline(),
      focusedBorder: focusedOutline(),
      errorBorder: null,
      focusedErrorBorder: null,
    );
  }

  Widget _otpBox(int index) {
    return SizedBox(
      width: 56.w,
      height: 56.h,

      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: _otpDecoration(context),
        onChanged: (v) => _onChangedBox(index, v),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthBackButton(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 24.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AuthScreenTitle(
                          title: 'Verification Code',
                          subtitle:
                              'Please confirm the security code received on your registered email.',
                        ),

                        SizedBox(height: 32.h),

                        Center(
                          child: Wrap(
                            spacing: 11.w,
                            runSpacing: 16.h,
                            children: List.generate(_otpLength, _otpBox),
                          ),
                        ),

                        SizedBox(height: 24.h),
                        CustomButton(text: 'Verify', onPressed: _submit),
                        SizedBox(height: 16.h),
                        // Re-send
                        Center(
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Did not receive the code?',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF7B7B7B),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Send Again',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF4B9954),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
