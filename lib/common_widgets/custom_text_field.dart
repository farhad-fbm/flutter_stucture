import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';

import '../gen/colors.gen.dart';

enum FieldType { email, password, confirmPassword }

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final String? hintText;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? paddingVertical;
  final TextEditingController controller;
  final TextEditingController? confirmPasswordController;
  final FieldType? fieldType;
  final bool isPassword;
  final bool obscureText;
  final bool toggleVisible;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixIconPressed;
  final bool readonly;
  final VoidCallback? onTap;
  final int? maxLines;

  const CustomTextField({
    super.key,
    this.labelText,
    this.prefixIconPath,
    this.suffixIconPath,
    this.hintText,
    this.fillColor = AppColors.c3A3A45,
    this.borderColor,
    this.borderRadius = 8,
    this.paddingVertical = 16,
    required this.controller,
    this.confirmPasswordController,
    this.fieldType,
    this.isPassword = false,
    this.obscureText = false,
    this.toggleVisible = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.onSuffixIconPressed,
    this.readonly = false,
    this.onTap,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        readOnly: readonly,
        onTap: onTap,
        maxLines: maxLines ?? 1,
        cursorColor: AppColors.cFFFFFF,
        style: TextFontStyle.textStyle14cFFFFFFInterRegular400,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.r,
            vertical: paddingVertical?.r ?? 16.r,
          ),
          labelText: labelText,
          // floatingLabelBehavior: FloatingLabelBehavior.always, //------
          labelStyle: TextFontStyle.textStyle14c828282NunitoRegular400,
          hintText: hintText,
          hintStyle: TextFontStyle.textStyle14c828282NunitoRegular400,

          filled: true,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!.r),
            borderSide: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 2,
            ),
          ),
          prefixIcon:
              prefixIconPath != null
                  ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Image.asset(
                      prefixIconPath!,
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.contain,
                      color: AppColors.cFFFFFF,
                    ),
                  )
                  : null,

          suffixIcon:
              suffixIconPath != null
                  ? InkWell(
                    onTap: onSuffixIconPressed,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Image.asset(
                        suffixIconPath!,
                        width: 16.w,
                        height: 16.h,
                        fit: BoxFit.contain,
                        color: AppColors.cFFFFFF,
                      ),
                    ),
                  )
                  : null,
          suffixIconConstraints: BoxConstraints(
            maxWidth: 40.w,
            maxHeight: 40.h,
            minWidth: 40.w,
            minHeight: 40.h,
          ),
        ),
      ),
    );
  }
}
