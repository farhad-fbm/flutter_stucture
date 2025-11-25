import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_app_bar.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_scaffold.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../gen/assets.gen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Change Password'),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // ___________________________________
                  CustomTextField(
                    upperTitle: "Old Password",
                    controller: oldPasswordController,
                    hintText: 'Old Password',
                    obscureText: !_isOldPasswordVisible,
                    isPassword: true,
                    toggleVisible: true,
                    suffixIconPath:
                        _isOldPasswordVisible
                            ? Assets.icons.eyeShow.path
                            : Assets.icons.eyeHide.path,
                    onSuffixIconPressed: () {
                      setState(
                        () => _isOldPasswordVisible = !_isOldPasswordVisible,
                      );
                    },
                  ),

                  SizedBox(height: 16.h),
                  CustomTextField(
                    upperTitle: "New Password",
                    controller: newPasswordController,
                    hintText: 'New Password',
                    obscureText: !_isNewPasswordVisible,
                    isPassword: true,
                    toggleVisible: true,
                    suffixIconPath:
                        _isNewPasswordVisible
                            ? Assets.icons.eyeShow.path
                            : Assets.icons.eyeHide.path,
                    onSuffixIconPressed: () {
                      setState(
                        () => _isNewPasswordVisible = !_isNewPasswordVisible,
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    upperTitle: "Confirm Password",
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
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
          ),
          SizedBox(height: 32.h),
          CustomButton(text: 'Confirm', onPressed: () {}),
        ],
      ),
    );
  }
}
