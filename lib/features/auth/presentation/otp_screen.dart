import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/text_font_style.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/ui_helpers.dart';
import '../../../common_widgets/custom_button.dart';

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

  // String get _code => _controllers.map((c) => c.text).join();

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
    // if (_code.length == _otpLength) {
    //
    // e.g. NavigationService.navigateTo(Routes.nextScreen);
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Please enter the 6-digit code')),
    //   );
    // }
    // NavigationService.navigateTo(Routes.resetPasswordScreen);
  }

  InputDecoration _otpDecoration(BuildContext context) {
    final borderRadius = BorderRadius.circular(0.r);

    OutlineInputBorder outline(Color c) => OutlineInputBorder(
      borderRadius: borderRadius,

      borderSide: BorderSide(color: c, width: 1),
    );

    return InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      filled: true,
      fillColor: AppColors.c5C6068,
      hintText: '-',
      counterText: '',
      enabledBorder: outline(AppColors.c5C6068),
      focusedBorder: outline(AppColors.c6A7282),
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
        style: TextFontStyle.textStyle24c071431Poppins500,
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
              InkWell(
                onTap: () => NavigationService.goBack,
                child: Image.asset(
                  Assets.icons.arrowBack.path,
                  height: 17.h,
                  width: 10.w,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 24.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Verification Code',
                          style: TextFontStyle.textStyle32c212121Poppins700,
                        ),
                        UIHelper.verticalSpace(16.h),
                        Text(
                          'Please confirm the security code received on yur registered email.',
                          style:
                              TextFontStyle.textStyle14c0184FFPoppins500,
                        ),
                        UIHelper.verticalSpace(24.h),

                        Center(
                          child: Wrap(
                            spacing: 11.w,
                            runSpacing: 16.h,
                            children: List.generate(_otpLength, _otpBox),
                          ),
                        ),

                        UIHelper.verticalSpace(24.h),
                        CustomButton(
                          text: 'Verify',
                          onPressed: _submit,
                          borderRadius: 0.r,
                        ),
                        UIHelper.verticalSpace(16.h),
                        // Re-send
                        Center(
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Did not receive the code?',
                                  style:
                                      TextFontStyle
                                          .textStyle14c0184FFPoppins500,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Send Again',
                                  style:
                                      TextFontStyle
                                          .textStyle14c0184FFPoppins500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(40.h),
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
