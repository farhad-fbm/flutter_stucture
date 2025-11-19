import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common_widgets/custom_text_field.dart';
import '../../../../constants/validator.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../common_widgets/auth_app_bar.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../gen/assets.gen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthAppBar(title: "Change Password"),
                UIHelper.verticalSpace(56.h),
            
                CustomTextField(
                  hintText: 'Enter Current password',
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  validator: passwordValidator,
                  isPassword: true,
                  toggleVisible: true,
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
                  hintText: "Enter New Password",
                  controller: newPasswordController,
                  isPassword: true,
                  toggleVisible: true,
                  obscureText: !_isNewPasswordVisible,
                  validator: passwordValidator,
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
            
                UIHelper.verticalSpace(24.h),
            
                UIHelper.verticalSpace(8.h),
                CustomTextField(
                  hintText: "Confirm New Password",
                  isPassword: true,
                  controller: confirmPasswordController,
                  toggleVisible: true,
                  obscureText: !_isConfirmPasswordVisible,
                  suffixIconPath:
                      _isConfirmPasswordVisible
                          ? Assets.icons.eyeShow.path
                          : Assets.icons.eyeHide.path,
                  onSuffixIconPressed: () {
                    setState(
                      () =>
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible,
                    );
                  },
                ),
                Spacer(),
                CustomButton(text: 'Update Password', onPressed: () {}),
                UIHelper.verticalSpace(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
